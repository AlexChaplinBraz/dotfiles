# Autostart programs.
sxhkd -m 1 &
unclutter --timeout 1 --jitter 4 &

# Swap Caps Lock with Escape:
setxkbmap -option caps:swapescape

# Set my tablet to work as intended:
tabletconf

# Load Xresources:
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# The window manager has to be run last.
exec bspwm
