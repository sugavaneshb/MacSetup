#!/bin/bash
# Handles the installation of various dot files automatically
# Inspired by Zach Holman's dotfiles installer

# Get the directory where install.sh is located
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

GIT_CONFIG="$DIR/gitconfig.dotfile"
GIT_IGNORE_FILE="$DIR/gitignore_global.dotfile"
BASHRC="$DIR/bashrc.dotfile"
BASH_PROFILE="$DIR/bash_profile.dotfile"
ALIASES="$DIR/aliases.dotfile"
EMACS_CONFIG="$DIR/emacs.dotfile"

echo ''
title () {
    printf "\n $1 \n"
}

user () {
      printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K  [\033[0;31mERROR\033[0m] $1\n"
    echo ''
    exit
}

warn () {
    printf "\r\033[2K  [\033[0;31mWARN\033[0m] $1\n"
    echo ''
}

link_file() {
    local src=$1 dst=$2

    if [ $dst == $src ]
    then
        fail "Can't link $src to $dst"
        skip=true;
    else
        # Backup the file if it already exists
	# TODO: Include a cron job to cleanup old dotfiles
        if [ ! -h $dst ]; then
            now=$(date +"%m-%d-%Y")
            info "$dst already exists, backing it up"
            mv $dst $dst.$now.backup
        else
            info "$dst is a symlink and cannot be backed up; revert to a prior commit to use an earlier version"
        fi
        ln -Fs $src $dst
        result=$?
        if [ $result -eq 0 ]
        then
            success "Linked $src to $dst"
        else
            fail "Failed to link $src to $dst"
        fi
    fi
}

# Bash
title "Setup bash config"
link_file $BASH_PROFILE ~/.bash_profile
link_file $BASHRC ~/.bashrc
link_file $ALIASES ~/.aliases

# Git
title "Setup git configuration"
link_file $GIT_CONFIG ~/.gitconfig
link_file $GIT_IGNORE_FILE ~/.gitignore_global

# Setup emacs config
title "Setup emacs config"
link_file $EMACS_CONFIG ~/.emacs

title "--The End--"
