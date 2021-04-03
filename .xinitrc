# Autostart programs:
sxhkd -m 1 &
unclutter --timeout 1 --jitter 4 &

# Swap Caps Lock with Escape and map AltGr to Control_R and set keyboard layouts:
setxkbmap -layout gb,es -option grp:win_space_toggle -option caps:swapescape -option ctrl:ralt_rctrl

# Set monitors:
xrandr --output DVI-I-1 --set TearFree on --output HDMI-A-0 --right-of DVI-I-1 --set TearFree on

# Setup tablet to left monitor, rotated:
xinput set-prop 'HID 256c:006e Pen Pen (0)' --type=float 'Coordinate Transformation Matrix' -0.5, 0, 0.5, 0, -1, 1, 0, 0, 1

# The window manager has to be run last:
exec dwm

