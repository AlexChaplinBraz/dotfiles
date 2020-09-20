# Autostart programs.
sxhkd -m 1 &
unclutter --timeout 1 --jitter 4 &

# Swap Caps Lock with Escape and map AltGr to Control_R
# and set keyboard layouts:
setxkbmap -layout gb,es -option grp:win_space_toggle -option caps:swapescape -option ctrl:ralt_rctrl

# Set my tablet to work as intended:
tabletconf

# The window manager has to be run last.
exec bspwm
