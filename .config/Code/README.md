These files also work for _Visual Studio Code - Insiders_.

## For Mac

Mac config files are in a different folder, create a symbolic link:

```shell
# first you might need to remove the existing folder
rm ~/Library/Application\ Support/Code\ -\ Insiders/
ln -s ~/.config/Code/User/ ~/Library/Application\ Support/Code\ -\ Insiders/
```

## Extensions

To dump the list of current extensions into the `vscode-extensions` file in this repo:

```shell
code-insiders --list-extensions \
    > ~/.config/Code/vscode-extensions
```

To install the dumped extensions:

```shell
cat ~/.config/Code/vscode-extensions \
    | xargs -L 1 echo code-insiders --install-extension \
    | bash
```
