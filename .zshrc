#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export EDITOR=vim
export VISUAL=vim
export SUDO_EDITOR=vim






export PATH=$PATH:/home/lhy/.local/bin

# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
unsetopt beep
# End of lines configured by zsh-newuser-install
zstyle :compinstall filename '/home/lhy/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
prompt walters

export ZSH=/usr/share/oh-my-zsh

ZSH_THEME="jreese"
source $ZSH/oh-my-zsh.sh

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions  
    archlinux
    history
    pip
    python
    vi-mode
    )

. /home/lhy/repos/z/z.sh

bindkey -v
bindkey '^f' autosuggest-accept
bindkey '^j' autosuggest-execute
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line






alias cmake-android-28='cmake -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_NDK=/home/daquexian/android/android-ndk-r17b -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a -DCMAKE_ANDROID_NDK_TOOLCHAIN_VERSION=clang -DCMAKE_ANDROID_STL_TYPE=c++_shared -DCMAKE_SYSTEM_VERSION=28'
