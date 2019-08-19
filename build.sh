#!/bin/sh
set -e

umask 022

release=/home/release

reldir="/home/rel-$(machine)"
relxdir="/home/relx-$(machine)"

destdir="/build/dest-$(machine)"
destxdir="/build/destx-$(machine)"

[[ -z "$*" ]] && set -- system system-release xenocara xenocara-release install-images finalise

for command
do
	echo ">> Running $command step..."
	case "$command" in
	(finalise)
		# Create index
		cd "$release"
		cp -p "$reldir"/* "$relxdir"/* .
		rm -f SHA256 SHA256.sig index.txt
		cksum -a sha256 * >.SHA256.tmp
		mv -f .SHA256.tmp SHA256
		signify -S -m SHA256 -s /home/dragon/etc/secret/dragon.sec -x SHA256.sig </home/dragon/etc/secret/dragon.pass
		cat SHA256 >>SHA256.sig
		chown 1001:0 *
		ls -Tn * >.index.tmp
		chown 1001:0 .index.tmp
		mv -f .index.tmp index.txt
		;;
	(install-images)
		# Create boot and installation disk images
		export "RELDIR=$reldir"
		export "RELXDIR=$relxdir"
		cd "/usr/src/distrib/$(machine)/iso"
		make
		make install
		;;
	(kernel)
		# Build and install a new kernel
		cd "/sys/arch/$(machine)/compile/GENERIC.MP"
		make obj
		make config
		make
		make install
		exec reboot
		;;
	(nuke)
		set -A devices -- $(mount | awk '$3 == "/build" || $3 == "/usr/obj" || $3 == "/usr/xobj" { print $1 }')
		umount "${devices[@]}"
		for device in "${devices[@]}"
		do
			device="${device#/dev/}"
			newfs "$device"
		done
		mount /build
		mount /usr/obj
		mount /usr/xobj
		rm -fr "$release" "$reldir" "$relxdir"
		mkdir -p "$release" "$reldir" "$relxdir" "$destdir" "$destxdir"
		chown build:wobj /build /usr/obj /usr/xobj "$release" "$reldir" "$relxdir" "$destdir" "$destxdir"
		chmod 0700 /build
		chmod 0770 /usr/obj /usr/xobj "$release" "$reldir" "$relxdir"
		;;
	(system)
		# Build a new base system
		cd /usr/src
		make obj
		make build
		sysmerge
		cd /dev
		./MAKEDEV all
		;;
	(system-release)
		# Make and validate the base system release
		export "RELEASEDIR=$reldir"
		export "DESTDIR=$destdir"
		cd /usr/src/etc
		make release
		cd /usr/src/distrib/sets
		sh checkflist
		unset RELEASEDIR DESTDIR
		;;
	(xenocara)
		# Build and install Xenocara
		cd /usr/xenocara
		make bootstrap
		make obj
		make build
		;;
	(xenocara-release)
		# Make and validate the Xenocara release
		export "RELEASEDIR=$relxdir"
		export "DESTDIR=$destxdir"
		make release
		make checkdist
		unset RELEASEDIR DESTDIR
		;;
	esac
	echo ">> Finished $command step"
done
