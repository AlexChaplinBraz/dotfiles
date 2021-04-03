# For correct zsh startup, this file needs to be symlinked to HOME.

# Default programs:
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=alacritty
export TERM=xterm # This is so ssh doesn't complain because I'm using Alacritty.
export BROWSER=dbrowsel
export READER=zathura
export FILE=ranger

# Set the XDG variables:
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_DOCUMENTS_DIR=~/Documents
export XDG_DOWNLOAD_DIR=~/Download
export XDG_MUSIC_DIR=~/Music
export XDG_PICTURES_DIR=~/Images
export XDG_VIDEOS_DIR=~/Videos

# Extra paths:
export MAIL=$XDG_DATA_HOME/Mail
export PROJECTS_DIR=~/Projects
export LOCAL_BIN=~/.local/bin

# Program settings:
export RANGER_LOAD_DEFAULT_RC=FALSE
export DPASS_OPTS='-C $XDG_DOCUMENTS_DIR/notes'
export NEWSH_NAME='Alexander Chaplin Braz'
export NEWSH_WEBSITE=https://alexchaplinbraz.com
export TRACKCONF_DOTFILES=$PROJECTS_DIR/dotfiles
export LESS='-i -J -M -R -W -x4 -z-4'

# Less colour configuration:
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Home clean-up:
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export LESSHISTFILE=~/.cache/lesshist
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/password-store
export GOPATH=~/.local/go
export CARGO_HOME=~/.local/cargo
export RUSTUP_HOME=~/.local/rustup
export CCACHE_DIR=~/.cache/ccache
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export INPUTRC=$XDG_CONFIG_HOME/inputrc
export GNUPGHOME=$XDG_DATA_HOME/gnupg

