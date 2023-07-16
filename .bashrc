#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export LANG=en_AU.UTF-8

export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
