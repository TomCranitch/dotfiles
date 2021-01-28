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
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator vi_mode)


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

VISUAL=nvim; export VISUAL
EDITOR=nvim; export EDITOR

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

# export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
export PATH=$JAVA_HOME/bin:$PATH

# Add .NET Core SDK tools
export PATH="$PATH:/home/tom/.dotnet/tools"

eval "$(starship init zsh)"
