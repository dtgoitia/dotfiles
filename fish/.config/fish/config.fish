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

function is_mac --description 'return true if current machine is a Mac'
    if [ (uname) = "Darwin" ]
        return 0
    else
        return 1
    end
end

function is_work_laptop --description 'return true if current machine is the work laptop'
    set work_user 'david.torralba'
    if [ $USER = $work_user ]
        return 0
    else
        return 1
    end
end

function add_to_path_if_dir_exists --argument-names 'path' --description 'Add path to PATH if path exists' 
    if test -d $path
        fish_add_path "$path"
    end
end

# Load direnv if installed
if type -q direnv
    direnv hook fish | source
else
    echo 'direnv is not installed'
end

# Load starship if installed
if type -q starship
    starship init fish | source
else
    echo 'starship is not installed'
end

# nnn
set --export NNN_USE_EDITOR 1
set --export VISUAL (which vim)
set --export NNN_RESTRICT_NAV_OPEN 1
set --export NNN_PLUG 'j:autojump;p:preview-tui;f:fzcd;o:fzopen'
set --export NNN_FIFO "/tmp/nnn.fifo"

# tmux
set -x TMUX_SHELL (which fish) # fish has different paths in Linux/MacOS

# git
function git_commit_from_branch_name --description "Create commit from branch name"
    set commit_message (git rev-parse --abbrev-ref HEAD | tr _ ' ' | sed -r 's/\//: /g')
    echo "Creating commit with message \"$commit_message\""
    git commit -am "$commit_message"
end

# Environment variables
# PATH docs: http://fishshell.com/docs/current/tutorial.html#path
# To print paths in PATH in fishshell, run `printf "%s\n" $PATH`
add_to_path_if_dir_exists "$HOME/Dropbox/projects-dropbox/scripts"  # Personal Dropbox scripts
add_to_path_if_dir_exists "$HOME/.local/bin"                        # Personal binaries
if type -q rust
    add_to_path_if_dir_exists "$HOME/.cargo/bin"     # Rust binaries
else if type -q rustup-init    # this is for Mac
    add_to_path_if_dir_exists "$HOME/.cargo/bin"     # Rust binaries
end
if type -q go
    add_to_path_if_dir_exists "$HOME/go/bin"        # Go binaries
    set -gx GOPATH "$HOME/go"           # Go PATH
end
add_to_path_if_dir_exists "$HOME/.tfenv/bin"                        # tfenv
add_to_path_if_dir_exists "$HOME/Dropbox/job/notes/2023-08-hiru-yld-pluspower/scripts"  # work related scripts

# ledger-cli entry file
set -x LEDGER_FILE "$HOME/projects/ledger-data/main.ledger"

# The next line updates PATH for the Google Cloud SDK.
if is_mac
    if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]
        # official curl+bash script installation
        . "$HOME/google-cloud-sdk/path.fish.inc"
    else if [ -f (brew --prefix)"/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc" ]
        # brew installation
        . (brew --prefix)"/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
    end
end

# homebrew
if [ -d "/home/linuxbrew/.linuxbrew" ]
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# load jump: https://github.com/gsamokovarov/jump
if type -q jump
    jump shell fish | source
end

# gcloud
if type -q gcloud
    if is_mac
        source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
    end
end

if type -q kubectl
    set kubeconfig_entrypoint "$HOME/.kube/config"
    set kubeconfigs (realpath (find ~/.kube/config.d -type f) | sed ':a;N;$!ba;s/\n/:/g')
    set -x KUBECONFIG "$kubeconfig_entrypoint:$kubeconfigs"
    set --erase kubeconfig_entrypoint kubeconfigs
end 

add_to_path_if_dir_exists "$HOME/.nix-profile/bin"
