#!/bin/sh

for p in ~/.local/bin ~/sbin ~/bin
do
	case ":$PATH:" in
	(*:$p:*)
		;;
	(*)
		PATH=$p:$PATH
		export PATH
		;;
	esac
done

. echo.sh

printenv DISPLAY > ~/.xsession-display
{
	printenv | grep -e '^SSH_AGENT_PID=' -e '^SSH_AUTH_SOCK=' | sort
	echo echo Agent pid \$SSH_AGENT_PID
} > ~/.ssh/agent.sh
nohup rmafter $$ ~/.xsession-display 2>&1 > /dev/null &

# Set desktop background
backgrounds=$(xdg-user-dir BACKGROUNDS)
if [ -f "$backgrounds/.current-desktop" ]
then
	set-desktop "$backgrounds/.current-desktop"
else
	randomise-backgrounds -d
fi

# Start user services
syncthing -no-browser &

# Start X services
redshift-hack &
xautolock -detectsleep -secure -locker slock -time 10 &
xbanish -i control -i mod4 &
xcompmgr &

# Reset power management
xset +dpms
xset dpms 300 600 900
xset s off

# Start window manager
dstat wpi0 > /dev/null &
exec dwm
