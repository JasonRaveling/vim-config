#!/bin/bash

# A small script that will install all symlinks for you. Use at your own risk. This will create symlinks in the respective vim directories in your home directory.

# create link for .vimrc
if [ -e $HOME/.vimrc ]; then
    echo '.vimrc already exists... backed up to .vimrcBACKUP';
    mv $HOME/.vimrc $HOME/.vimrcBACKUP;
fi

ln -s $PWD/vimrc $HOME/.vimrc;


# create link for color schemes
if [ ! -d "$HOME/.vim/colors" ]; then
    echo "Creating ~/.vim/colors/ directory";
    mkdir $HOME/.vim/colors;
fi

for s in `ls colors/*`; do ln -s $s ~/.vim/colors/`basename $s`; done;


# set 256 color in terminal
if ! grep -q "export TERM=xterm-256color" $HOME/.bashrc; then 
    echo 'Adding 256 color support to terminal.';
    echo 'export TERM=xterm-256color' >> $HOME/.bashrc;
fi
