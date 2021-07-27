These files also work for _Visual Studio Code - Insiders_.

## For Mac

Mac config files are in a different folder, create a symbolic link:

```shell
# first you might need to remove the existing folder
rm -rf "$HOME/Library/Application Support/Code - Insiders/"
ln -s "$HOME/.config/Code - Insiders/User/" "$HOME/Library/Application Support/Code - Insiders/User"

# check the link was created correctly
ls -al "$HOME/Library/Application Support/Code - Insiders/" | grep "User "
# User -> ~/.config/Code/User/

```

## Extensions

To **save** the current list of installed extensions:

```shell
backup_vscode_extensions.py
```

To **restore** latest saved list of extensions:

```shell
restore_last_vscode_extensions.py.py
```
