These configs are aimed at being used in the terminal for web development (PHP, JS, CSS, SASS) as well as dabbling in other languages. Other languages include (Python, C, C++, Java). Although, this should be as versatile as possible. Afterall its Vim. While these configs are meant for terminal they should likely work with gVim.

You may notice that color schemes, plugins, etc. all have the files and content taken directly from their repos or source. This is partly because I'm lazy and want to make it easy to update individual parts of *this* repo as needed but also because licensing and credit is given where due in these files.

## Installation
These configs were made using GNU/Linux (`echo $emacsRant > /dev/null`) but may work on other operating systems. To install, just open the terminal and do the following.

`git clone https://github.com/webunraveling/vim-config.git`

and then make the new directory, containing the repo, your working directory.

`cd vim-config`

### Automatic
`chmod +x install.sh && ./install.sh`

### Manual

Create the symlink for .vimrc in your home directory.

`ln -s vimrc $HOME/.vimrc`

**(Optional)** Then add the color scheme(s). If you already have color schemes be sure you aren't overwritting anything before running this command. If 256 color is not on already, enter `export TERM=xterm-256color` into your `.bashrc`. If you'd rather create symlinks, you can do that too. That way you only have to do `git pull` when updating this repo and everything will be up to date. If you use the line below, you'll have to run the command every time you update.

`cp -r vim-config/colors $HOME/.vim/`
