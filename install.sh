# A small script that will install all symlinks for you. Use at your own risk. This will create symlinks in the respective vim directories in your home directory.

# setup vars
vimDir=$HOME/.vim;
vimrc=$HOME/.vimrc;
bundleDir=$HOME/.vim/bundle # dir that pathogen loads from
scriptDir=`dirname $(readlink -f $0)`;

# create .vim directory if it doesnt exist
if [ ! -d $vimDir ]; then
    echo ".vim does not exist. Creating it.";
    mkdir ${HOME}/.vim;
fi

# create link for .vimrc
if [ -f $vimrc ]; then
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
        echo "Adding color scheme: ${s}";
        ln -s "${PWD}/${s}" $colorLink;
    fi
done

# set 256 color in terminal
if ! grep -q "export TERM=xterm-256color" $HOME/.bashrc; then 
    echo 'Adding 256 color support to terminal.';
    echo 'export TERM=xterm-256color' >> $HOME/.bashrc;
fi

# set solarized colors for all other of terminal
if ! grep -q "eval `/misc/dir_colors/dircolors.256dark`" $HOME/.bashrc; then
    echo 'Adding Solarized Dark support for other terminal applications.';
    echo 'eval `dircolors '$scriptDir'/misc/dir_colors/dircolors.256dark`' >> $HOME/.bashrc;
fi

# auto load solarized theme in Vim
if [ ! -d ${vimDir}/autoload ]; then
    echo "Creating directory: ${vimDir}/autoload";
    mkdir ${vimDir}/autoload;
fi

ln -s $PWD/autoload $vimDir/autoload;

# add color schemes to Konsole
if [ ! -d $HOME/.kde/share/apps/konsole ]; then
    echo;
    echo "Konsole configs were not found. Konsole is KDE's terminal application. If you do not use Konsole, you can answer \"N\" but you should probably add the needed color scheme to your terminal application so that Vim color schemes appear as intended."; 
    echo;
    read -p "Would you like to copy the color scheme files for Konsole (${HOME}/.kde/share/apps/konsole/) [Y/n] " answer;

    if [[ $answer == "Y" || $answer == "y" || -z $answer ]]; then
        mkdir -p $HOME/.kde/share/apps/konsole;
    fi
fi

for ks in `ls misc/konsole/*`
do
    konsoleColor="${HOME}/.kde/share/apps/konsole/"`basename $ks`;

    if [ ! `basename $ks` == "readme.md" ]; then
        echo "Adding Konsole color scheme: ${ks}";
        ln -s "${PWD}/${ks}" $konsoleColor;
    fi
done

# find out if we should create Konsole colorscheme files


# add indentation
########################################
if [ ! -d $vimDir/indent ]; then
    echo "Creating directory: ${vimDir}/indent";
    mkdir ${vimDir}/indent;
fi

for ind in `ls indent/*`;
do
    indentLink="${vimDir}/indent/"`basename $ind`;

    if [ ! -e $indentLink ]; then
        echo "Adding indent script: ${ind}";
        ln -s "${PWD}/${ind}" $indentLink;
    fi
done

# add syntax
########################################

if [ ! -d $vimDir/syntax ]; then
    mkdir $vimDir/syntax;
fi

for syn in `ls syntax/*`;
do
    syntaxLink="${vimDir}/syntax/"`basename $syn`;

    if [ ! -e $syntaxLink ]; then
        echo "Adding syntax script: ${syn}";
        ln -s "${PWD}/${syn}" $syntaxLink; 
    fi
done


# add plugins
########################################
if [ ! -d $vimDir/plugins ]; then
    echo "Creating directory: ${vimDir}/plugins";
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
    echo "Created directory: ${bundle}";
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

# add vim-gitgutter
if [ ! -e $bundleDir/vim-gitgutter ]; then
    echo "Adding Plugin: vim-gitgutter";
    ln -s $PWD/plugins/vim-gitgutter $bundleDir/;
fi

# add vim-airline
if [ ! -e $bundleDir/vim-airline ]; then
    echo "Adding Plugin: vim-airline";
    ln -s $PWD/plugins/vim-airline $bundleDir/;
fi

# add vim-airline-themes
if [ ! -e $bundleDir/vim-airline-theme ]; then
    echo "Adding Plugin: vim-airline-themes";
    ln -s $PWD/plugins/vim-airline-themes $bundleDir/;
fi

# add vim-fugitive
if [ ! -e $bundleDir/vim-fugitive ]; then
    echo "Adding Plugin: vim-fugitive";
    ln -s $PWD/plugins/vim-fugitive $bundleDir/;
fi

