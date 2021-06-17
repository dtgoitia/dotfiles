## For Mac

Mac config files are in a different folder, create a symbolic link:

```shell
# first you might need to remove the existing folder
rm -rf "$HOME/Library/Application Support/Spectacle/"
ln -s "$HOME/.config/Spectacle" "$HOME/Library/Application Support/Spectacle"

# check the link was created correctly
ls -al "$HOME/Library/Application Support/Spectacle" | grep "Spectacle "
# Spectacle -> ~/.config/Spectacle
```