# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Load aliases if existent:
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# History (need to actually mkdir for it to work):
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$HOME/.cache/zsh/history"

# Basics:
autoload -U compinit
zmodload zsh/complist
compinit
zstyle ':completion:*' menu select
export KEYTIMEOUT=1
fpath+=("$HOME/.local/src/pure")

# Run through a keyboard definition setup to fix some keys
# not working properly and conflicting with vi mode.
autoload zkbd
[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd

# Source the file created by zkbd. If it can't find it, the file may not have
# been named correctly. Simply go where it's supposed to be and rename it to
# what it's trying to find.
source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE

# Bind the keys to what they're supposed to do.
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Better LC_COLORS:
. /usr/share/LS_COLORS/dircolors.sh

# Vi mode:
bindkey -v

# Use vi keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes:
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor for each new prompt.
precmd() { echo -ne '\e[5 q' ;}

# Use lf to switch directories and bind it to ctrl-o:
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in $EDITOR with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line
bindkey -M viins '^e' edit-command-line

# Load zsh-syntax-highlighting:
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Initialize prompt:
autoload -U promptinit; promptinit
prompt pure

# Single line prompt:
#prompt_newline='%666v'
#PROMPT=" $PROMPT"
