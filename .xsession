#!/bin/ksh

# Pull in login environment
[ -r /etc/profile ] && . /etc/profile
[ -r ~/.profile ] && . ~/.profile

# Export display name
printenv DISPLAY > ~/.xsession-display
nohup rmafter $$ ~/.xsession-display > /dev/null 2>&1 &

# Set desktop background
backgrounds=$(xdg-user-dir BACKGROUNDS)
if [ -s "$backgrounds/.current-desktop" ]
then
	(cd "$backgrounds" && set-desktop "$(<.current-desktop)")
else
	randomise-backgrounds -d
fi

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
