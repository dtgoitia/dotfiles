# Suppress greeting on start
set fish_greeting

# Load Powerline, otherwise custom prompt
# set powerline_fish_bindings_path "/usr/lib/python3.7/site-packages/powerline/bindings/fish"
# if test -e "$powerline_fish_bindings_path"
#     set fish_function_path $fish_function_path $powerline_fish_bindings_path
#     powerline-setup
# else
#     source ~/.config/fish/functions/fish_prompt.fish
# end

# Load abbreviations
source ~/.config/fish/abbreviations/general.fish
source ~/.config/fish/abbreviations/git.fish
source ~/.config/fish/abbreviations/fish.fish
source ~/.config/fish/abbreviations/python.fish

function is_work_laptop --description 'return true if current machine is the work laptop'
    set work_user 'david.torralba'
    if [ $USER = $work_user ]
        return 0
    else
        return 1
    end
end

# Load direnv if installed
if type -q direnv
    direnv hook fish | source
else
    echo 'direnv is not installed'
end

# Load work scripts
if is_work_laptop
    set babylon_fish_config '/Users/david.torralba/Dropbox/babylon-health/fish-scripts/babylon.fish'
    if test -e $babylon_fish_config
        source $babylon_fish_config
    else
        echo '>>> I cannot find the Babylon-specific fish config'
    end
end

# Load starship if installed
if type -q starship
    starship init fish | source
else
    echo 'starship is not installed'
end

# nnn
set -x NNN_USE_EDITOR 1
set -x VISUAL vim
set -x NNN_RESTRICT_NAV_OPEN 1

# tmux
set -x TMUX_SHELL (which fish) # fish has different paths in Linux/MacOS

# Environment variables
# PATH docs: http://fishshell.com/docs/current/tutorial.html#path
# To print paths in PATH in fishshell, run `printf "%s\n" $PATH`
fish_add_path "$HOME/Dropbox/projects-dropbox/scripts"  # Custom scripts
if type -q rust
   fish_add_path "$HOME/.cargo/bin"     # Rust binaries
end
if type -q go
    fish_add_path "$HOME/go/bin"        # Go binaries
    set -gx GOPATH "$HOME/go"           # Go PATH
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/david.torralba/google-cloud-sdk/path.fish.inc' ]; . '/Users/david.torralba/google-cloud-sdk/path.fish.inc'; end
