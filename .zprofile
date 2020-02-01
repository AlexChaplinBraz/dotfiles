# Profile file. Runs on login.

# Source environmental variables:
[ -f "$HOME/.config/envvars" ] && source "$HOME/.config/envvars"

# Save a list of installed packages:
saveinstalled

# Start MPD daemon (if no other user instance exists):
[ ! -s ~/.config/mpd/pid ] && mpd

# Sync $HOME:
rbackup

# Sync dotfiles:
rdot
