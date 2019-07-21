# Load Powerline, otherwise custom prompt
set powerline_fish_bindings_path "/usr/lib/python3.7/site-packages/powerline/bindings/fish"
if test -e "$powerline_fish_bindings_path"
    set fish_function_path $fish_function_path $powerline_fish_bindings_path
    powerline-setup
else
    source ~/.config/fish/functions/fish_prompt.fish
end

# Load abbreviations
source ~/.config/fish/abbreviations/general.fish
source ~/.config/fish/abbreviations/git.fish
source ~/.config/fish/abbreviations/vcsh.fish

# nnn
set -x NNN_USE_EDITOR 1
set -x VISUAL vim
set -x NNN_RESTRICT_NAV_OPEN 1

# Environment variables
# set -gx PATH "$HOME/.cargo/bin"     # Rust binaries
set -gx PATH $PATH "$HOME/go/bin"   # Go binaries
set -gx GOPATH "$HOME/go"           # Go PATH

