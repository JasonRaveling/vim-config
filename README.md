Mainly keeping Vim7 configs alive for working serverside. There are still a lot of servers that haven't updated to Vim8.

These configs are aimed at being used in the terminal for web development (PHP, JS, CSS, SASS). Although, it should work with pretty much any languages. Afterall its Vim. While these configs are meant for terminal they should work well with gVim too.

The color schemes, plugins, etc. all have the files and content taken directly from their repos or source for easy updating from the original source when needed.

## Installation
These configs were made using GNU/Linux but may work on other operating systems. To install, just open the terminal and do the following.

`git clone https://github.com/webunraveling/vim-config.git && cd vim-config`

Then choose if you'd like to install automatically or manually.

### Automatic
`chmod +x install.sh && ./install.sh`

### Manual
Just place all of the directories from this repository into your `.vim` directory. If you already have a `.vim` directory then place the contents into their respective directories. Then place `vimrc` in your home directory, renamed to `.vimrc` (a dot file). Although, creating symlinks would be a better option than copying files as you can just run `git pull` when the repo is updated and there will be no need to copy all of the files again.

## Adding Color Schemes
This is completely optional. If you already have color schemes be sure you aren't overwritting anything before running this command. If your XTERM doesn't already use 256 colors, add `export TERM=xterm-256color` to your `.bashrc`. This is done for you if you use the automatic install script.

# do not display errors
`echo $emacsRant > /dev/null`
