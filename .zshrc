#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export EDITOR=vim
export VISUAL=vim
export SUDO_EDITOR=vim
export TERM=xterm-256color
export PATH=$PATH:～/.local/bin

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
unsetopt beep
# End of lines configured by zsh-newuser-install
zstyle :compinstall filename '～/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
prompt walters

export ZSH=/usr/share/oh-my-zsh

ZSH_THEME="pygmalion"
source $ZSH/oh-my-zsh.sh

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions  
    archlinux
    history
    pip
    python
    )
. /usr/share/oh-my-zsh/z.sh
case $(uname -a) in
   *Microsoft*) unsetopt BG_NICE ;;
esac
bindkey -v
bindkey '^f' autosuggest-accept
bindkey '^j' autosuggest-execute
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

alias ls='exa --color=auto'
