# .xsession (2006-07-04)

[ -r "$HOME/.profile" ] && . "$HOME/.profile"

[ -r "$HOME/.Xresources" ] && xrdb -load "$HOME/.Xresources"

setxkbmap fr

# TrackPoint wheel emulation (middle button scroll)
[ -e /dev/wsmouse ] && {
	xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
	xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
	xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5
} 

xbacklight -set 30
xsetroot -solid '#3a4d53'
xidle -timeout 120 &

# Alert monitor (every 5 min)
( while :; do alert 2>&1 | xnotify; sleep 300; done ) &

exec cwm || exit 1
