# Load Powerline
set fish_function_path $fish_function_path '/usr/lib/python3.7/site-packages/powerline/bindings/fish'
powerline-setup

# Load abbreviations
source ~/.config/fish/abbreviations/general.fish
source ~/.config/fish/abbreviations/git.fish
source ~/.config/fish/abbreviations/vcsh.fish

# nnn
set -x NNN_USE_EDITOR 1
set -x VISUAL vim
set -x NNN_RESTRICT_NAV_OPEN 1

# Environment variables
# set -x PATH '$HOME/.cargo/bin:$PATH' # Rust binaries
set -x PATH "$PATH:$HOME/go/bin"			# Go binaries
set -x GOPATH "$HOME/go:/tmp/trizen-dtg"		# Go PATH

