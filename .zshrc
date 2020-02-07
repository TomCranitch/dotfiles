# Created by newuser for 5.5.1
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tom/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

# Customize powerlevel prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator vi_mode)


c() {
	if [ -n "$1" ]
	then
		echo "$1" | bc -l
	else
		echo "No arguments given"
	fi
}

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

autoload -Uz promptinit
promptinit

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/tom/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/home/tom/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/tom/anaconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/home/tom/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<

VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

alias peaclock="peaclock --config-dir ~/.config/peaclock"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Nextcloud/Development
source /usr/bin/virtualenvwrapper.sh

if [ -f ~/.bwsession ]; then
    source ~/.bwsession
else
    print "404: ~/.bwsession not found. Please generate a bw session key"
fi

export PATH=/opt/flutter/bin:$PATH

# Suppress opencv warnings
export OPENCV_LOG_LEVEL=ERROR
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
