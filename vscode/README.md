The config files stored here are valid for:
  - Visual Studio Code (a)
  - Visual Studio Code - Insiders
  - [VSCodium][1]

All file are kept in sync with symlinks. `Code/` and `VSCodium/` point to `Code - Insiders/`.

## For Mac

Mac config files are in a different folder, create a symbolic link:

```shell
# first you might need to remove the existing folder
rm -rf "$HOME/Library/Application Support/Code - Insiders/User"
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

<!-- External references -->

[1]: https://vscodium.com/ "VSCodium"
