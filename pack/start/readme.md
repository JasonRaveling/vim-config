Place plugins here within their own directory. These will be loaded when you start vim.

# Adding Plugins Directly from Git
Plugins can be added as submodules which makes it easier to update them.

## Adding a plugin as a submodule
This will basically clone the repo in a new directory inside your main repo.

    git submodule add https://github.com/pluginname pack/mypackages/start/pluginname

## Updating a submodule
See how easy it is to update a plugin when you add it as a submodule?

    git submodule update --remote --merge

## Removing a submodule
Removing a submodule is pretty painless as well.

    git submodule deinit vim/pack/mypackages/start/nameofplugin
    git rm vim/pack/mypackages/start/nameofplugin
    rm -Rf .git/modules/vim/pack/mypackages/start/nameofplugin
