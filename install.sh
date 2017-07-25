# This is a small script that will modify your bashrc and vimrc.

# setup vars
vimDir=$HOME/.vim;
vimrc=$HOME/.vimrc;
bundleDir=$HOME/.vim/bundle # dir that pathogen loads from
scriptDir=`dirname $(readlink -f $0)`;

# warning message before proceeding
echo "BEORE YOU BEGIN: Be sure you have backed up your .vim directory and moved/renamed the vim-config directory (this repo) to .vim. Otherwise the configs will not work."
echo
read -p "Have you done this already? (y/N) " readyOrNot
if [[ $readyOrNot != "y" && $readyOrNot != "Y" ]]; then
    echo "Exited script."
    echo
    exit;
fi

#########################
# changes to .vimrc
#########################

# new source for .vimrc
if [ -f $vimrc ]; then
    mv $vimrc $HOME/.vimrcBACKUP-`date +%s`;
    echo '.vimrc already exists... backed up to .vimrcBACKUP-'`date +%s`;
fi

echo 'source $HOME/.vim/vimrc' > $vimrc;


#########################
# changes to .bashrc
#########################

# set 256 color in terminal
if ! grep -q "export TERM=xterm-256color" $HOME/.bashrc; then 
    echo 'Adding 256 color support to terminal.';
    echo 'export TERM=xterm-256color' >> $HOME/.bashrc;
fi

# set solarized colors for everything in the terminal
if ! grep -q "dircolors.256dark" $HOME/.bashrc; then
    echo 'Adding Solarized Dark support to .bashrc.';
    echo 'eval `dircolors '$scriptDir'/misc/dir_colors/dircolors.256dark`' >> $HOME/.bashrc;
else
    echo 'dircolors.256color already present in .bashrc... skipping.'
fi
