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

`stow` will not create symlinks pointing to any path matching the RegEx patterns in the `~/.stow-global-ignore` and `.stow-local-ignore` files ([docs][3]).

Use `.gitignore` files to avoid saving directories or paths to the `dotfiles` repository.

### Cheat sheet

Remove symlinks: `stow --delete my_package`
Dry run: `stow --simulate`
Verbose mode: `stow --verbose`
Very verbose mode: `stow -vvvvv`

<!-- External references -->

[1]: https://www.gnu.org/software/stow/manual/stow.html "GNU stow manual"
[2]: https://youtu.be/7mv411guRaI "[GNU Stow] - Dotfile management"
[3]: https://www.gnu.org/software/stow/manual/html_node/Types-And-Syntax-Of-Ignore-Lists.html#Types-And-Syntax-Of-Ignore-Lists "[GNU Stow] - Types and syntax of ignore lists"
