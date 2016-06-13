# vim-config
These configs are aimed at being used in web development (PHP, JS, CSS, SASS) as well as dabbling in other languages. Other languages include (Python, C, C++, Java). Although, this should be as versatile as possible. Afterall its vim.

## Installation
These configs are meant for Linux, I'm not sure if VIM is very different in other operating systems. To install, just open the terminal and do the following.

`git clone https://github.com/webunraveling/vim-config.git`

Then create the symlink for .vimrc in your home directory.

`ln -s vim-config/vimrc ~/.vimrc`

**(Optional)** Then add the color scheme(s). If you already have color schemes be sure you aren't overwritting anything before running this command.

`cp -r vim-config/colors ~/.vim/`
