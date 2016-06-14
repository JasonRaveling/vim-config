#!/bin/bash

# A small script that will install all symlinks for you. Use at your own risk. This will create symlinks in the respective vim directories in your home directory.

# setup vars
vimDir=$HOME/.vim;
vimrc=$HOME/.vimrc;
bundleDir=$HOME/.vim/bundle # dir that pathogen loads from

# create link for .vimrc
if [ -e $vimrc ]; then
    echo '.vimrc already exists... backed up to .vimrcBACKUP';
    mv $vimrc $HOME/.vimrcBACKUP;
fi

ln -s $PWD/vimrc $vimrc;


# create link for color schemes
########################################
if [ ! -d $vimDir/colors ]; then
    echo "Creating 'colors' directory: ${vimDir}/colors";
    mkdir "${vimDir}/colors";
fi

for s in `ls colors/*`
do
    colorLink="${vimDir}/colors/"`basename $s`;

    if [ ! -e $colorLink ]; then
        ln -s "${PWD}/${s}" $colorLink;
    fi
done

# set 256 color in terminal
if ! grep -q "export TERM=xterm-256color" $HOME/.bashrc; then 
    echo 'Adding 256 color support to terminal.';
    echo 'export TERM=xterm-256color' >> $HOME/.bashrc;
fi


# add plugins
########################################
if [ ! -d $vimDir/plugins ]; then
    echo "Creating 'plugins' directory: ${vimDir}/plugins";
    mkdir $vimDir/plugins;
fi

# add pathogen (handles the rest of the plugins)
if [ ! -d $vimDir/autoload ]; then
    echo "Creating 'autoload' directory: ${vimDir}/autoload";
    mkdir $vimDir/autoload;
fi

echo "Adding Pathogen Plugin Manager";
if [ ! -e $vimDir/autoload/pathogen.vim ]; then
    ln -s $PWD/plugins/vim-pathogen/autoload/pathogen.vim "${vimDir}/autoload/pathogen.vim";
fi

if [ ! -d $bundleDir ]; then
    mkdir $bundleDir;
fi

# add NERD tree
if [ ! -e $bundleDir/nerdtree ]; then
    echo "Adding Plugin: NERD Tree";
    ln -s $PWD/plugins/nerdtree $bundleDir/;
fi

# add vim-css3-syntax
if [ ! -e $bundleDir/vim-css3-syntax ]; then
    echo "Adding Plugin: vim-css3-syntax";
    ln -s $PWD/plugins/vim-css3-syntax $bundleDir/;
fi

# add scss-syntax
if [ ! -d $vimDir/syntax ]; then
    mkdir $vimDir/syntax;
fi

ln -s $PWD/plugins/scss-syntax/syntax/scss.vim $vimDir/syntax/
