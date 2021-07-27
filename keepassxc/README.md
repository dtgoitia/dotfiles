## For Mac

Mac config files are in a different folder, create a symbolic link:

```shell
# first you might need to remove the existing folder
rm -rf "$HOME/Library/Application Support/KeePassXC/"
ln -s "$HOME/.config/KeePassXC" "$HOME/Library/Application Support/KeePassXC"

# check the link was created correctly
ls -al "$HOME/Library/Application Support/KeePassXC" | grep "KeePassXC "
# KeePassXC -> ~/.config/KeePassXC
```
