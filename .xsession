#!/bin/sh

PATH="$HOME/bin:$PATH"
export PATH

printenv DISPLAY > "$HOME/tmp/x.env.display"
{
  printenv | grep -e '^SSH_AGENT_PID=' -e '^SSH_AUTH_SOCK=' | sort
  echo echo Agent pid \$SSH_AGENT_PID
} > "$HOME/tmp/x.env.ssh"
nohup rmafter $$ "$HOME/tmp/x.env.display" "$HOME/tmp/x.env.ssh" 2>&1 > /dev/null &

randomise-wallpaper -s

compton &
xautolock -detectsleep -secure -locker slock -time 10 &

xset +dpms
xset dpms 300 600 900
xset s off

dstat wpi0 > /dev/null &
exec dwm
