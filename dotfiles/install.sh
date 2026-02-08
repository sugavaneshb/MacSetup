#!/bin/zsh
# Handles the installation of various dot files automatically
# Inspired by Zach Holman's dotfiles installer

# Get the directory where install.sh is located
DIR="${0:A:h}"

ZSHRC="$DIR/zshrc.dotfile"
ZPROFILE="$DIR/zprofile.dotfile"
GIT_CONFIG="$DIR/gitconfig.dotfile"
GIT_IGNORE_FILE="$DIR/gitignore_global.dotfile"
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

    if [ $dst = $src ]
    then
        fail "Can't link $src to $dst"
        skip=true;
    else
        # Backup the file if it already exists
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

# Zsh
title "Setup zsh config"
link_file $ZSHRC ~/.zshrc
link_file $ZPROFILE ~/.zprofile

# Git
title "Setup git configuration"
link_file $GIT_CONFIG ~/.gitconfig
link_file $GIT_IGNORE_FILE ~/.gitignore_global

# Emacs (uses ~/.emacs.d/init.el instead of ~/.emacs)
title "Setup emacs config"
mkdir -p ~/.emacs.d
link_file $EMACS_CONFIG ~/.emacs.d/init.el

title "--The End--"
