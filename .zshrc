#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export TERM=xterm-256color
export PATH=$PATH:～/.local/bin
source /usr/share/oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
unsetopt beep

# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

export ZSH=/usr/share/oh-my-zsh
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim

export http_proxy=127.0.0.1:8118
export https_proxy=127.0.0.1:8118
export HTTP_PROXY=127.0.0.1:8118
export HTTPS_PROXY=127.0.0.1:8118

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
prompt walters


ZSH_THEME="pygmalion"
source $ZSH/oh-my-zsh.sh

plugins=(
    git
    archlinux
    history
    pip
    python
    vi-mode
    z
    )

bindkey -v
bindkey '^f' autosuggest-accept
bindkey '^j' autosuggest-execute
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey '^[[Z' reverse-menu-complete
bindkey "^?" backward-delete-char

export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export TERMINAL=termite

fzfp(){
    fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'
}
fh(){
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *\**//')
}
alias vim=nvim
alias cat=bat
alias ls=exa
alias top=htop
# Map caps lock to control
setxkbmap -option ctrl:nocaps
# Map single control to escape
# xcape -e 'Control_L=Escape'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
