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
# source ~/.config/fish/abbreviations/vcsh.fish
source ~/.config/fish/abbreviations/fish.fish

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
        echo '>>> I cannot find Babylon specific fish config'
    end

    # Load virtualfish (virtualenvwrapper alternative)
    eval (python3 -m virtualfish)
end

# Load starship
starship init fish | source

# nnn
set -x NNN_USE_EDITOR 1
set -x VISUAL vim
set -x NNN_RESTRICT_NAV_OPEN 1

# Environment variables
if type -q rust
   set -gx PATH "$HOME/.cargo/bin"   # Rust binaries  
end
if type -q go
    set -gx PATH $PATH "$HOME/go/bin"   # Go binaries
    set -gx GOPATH "$HOME/go"           # Go PATH
end
