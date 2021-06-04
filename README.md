## Requirements

* GNU `stow` [[1][1]]: to easily symlink subsets of config directories and/or files.

## Usage

```shell
git clone git@github.com:dtgoitia/dotfiles.git
cd dotfiles

# Pick the desired config
stow tmux/
```

The example above will symlink the content inside of `~/dotfiles/tmux/` from `~/`.

See [here][2] for an example (video).

### Cheat sheet

Remove symlinks: `stow --delete my_package`
Dry run: `stow --simulate`
Verbose mode: `stow --verbose`
Very verbose mode: `stow -vvvvv`

<!-- External references -->

[1]: https://www.gnu.org/software/stow/manual/stow.html "GNU stow manual"
[2]: https://youtu.be/7mv411guRaI "[GNU Stow] - Dotfile management"
