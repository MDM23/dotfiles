if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?* ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb ~/.Xresources
xsetroot -cursor_name left_ptr
setxkbmap -option caps:escape

if [ "$LOCATION" = "home" ]; then
  xrandr --output DP-2 --right-of "HDMI-0" --primary
fi

exec bspwm
