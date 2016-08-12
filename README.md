These configs are aimed at being used in the terminal for web development (PHP, JS, CSS, SASS) as well as dabbling in other languages. Other languages include (Python, C, C++, Java). Although, this should be as versatile as possible. Afterall its Vim. While these configs are meant for terminal they should likely work with gVim.

The color schemes, plugins, etc. all have the files and content taken directly from their repos or source. This is partly because I'm lazy and want to make it easy to update individual parts of *this* repo as needed but also because licensing and credit is given where due in these files.

## Installation
These configs were made using GNU/Linux (`echo $emacsRant > /dev/null`) but may work on other operating systems. To install, just open the terminal and do the following.

`git clone https://github.com/webunraveling/vim-config.git`

then make the new directory, containing the repo, your working directory.

`cd vim-config`

### Automatic
`chmod +x install.sh && ./install.sh`

### Manual
Just place all of the directories from this repository into your `.vim` directory. If you already have a `.vim` directory then place the contents into their respective directories. Then place `vimrc` in your home directory, renamed to `.vimrc` (a dot file). Although, creating symlinks would be a better option than copying files as you can just run `git pull` when the repo is updated and there will be no need to copy all of the files again.

## Adding Color Schemes
This is completely optional. If you already have color schemes be sure you aren't overwritting anything before running this command. If your XTERM doesn't already use 256 colors, add `export TERM=xterm-256color` to your `.bashrc`.
