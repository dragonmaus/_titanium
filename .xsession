#!/bin/sh

PATH=~/bin:$PATH
export PATH

# Set up environment exports
printenv DISPLAY > ~/tmp/x.env.display
{
  printenv | grep -e '^SSH_AGENT_PID=' -e '^SSH_AUTH_SOCK=' | sort
  echo echo Agent pid \$SSH_AGENT_PID
} > ~/tmp/x.env.ssh
nohup rmafter $$ ~/tmp/x.env.* 2>&1 > /dev/null &

# Start X services
redshift-hack &
unclutter -jitter 5 &
xautolock -detectsleep -secure -locker slock -time 10 &
xcompmgr &

# Reset power management
xset +dpms
xset dpms 300 600 900
xset s off

# Start window manager
randomise-wallpaper -s
dstat wpi0 > /dev/null &
exec dwm
