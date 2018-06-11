# Load Powerline
set fish_function_path $fish_function_path "/usr/lib/python3.6/site-packages/powerline/bindings/fish"
powerline-setup

# Git
alias g='git' # Use 'g' as git (you still can use 'git')
alias gs='git status'
alias ga='git add'
alias gai='git add -i'
alias gc='git commit'
alias gpl='git pull'
alias gpsa='git push --all'
alias gps='git push'
alias gpla='git pull --all'
alias gch='git checkout'
alias gb='git branch'
alias gr='git remote'
alias gl='git log --oneline --all --graph --decorate'
alias gitconfig='np ~/.gitconfig'

# Directories
alias ice='cd ~/Dropbox/ICE/charter'
alias civ='cd ~/projects/civil-autolisp'
alias lang='cd ~/.atom/packages/language-autolisp'
alias config='cd ~/Dropbox/config'
alias desktop='cd ~/Desktop/'
#alias dropbox='cd ~/Dropbox/'
alias projects='cd ~/projects'
# alias scripts='cd ~/.scripts'

# Applications
# alias firefox='"C:\Program Files\Firefox Developer Edition\firefox.exe"'
# alias fi='firefox'
# alias inkscape='"C:\Program Files\Inkscape\inkscape.exe"'
# alias meld='"C:/Program Files (x86)/Meld/meld/meld.exe"'
# alias notepad='"C:/Program Files (x86)/Notepad++/notepad++.exe"'
alias np='vim'
alias e='nautilus .'

# Reload BASH
alias brc="source ~/Dropbox/config/.bashrc"
alias settings="np ~/.config/fish/config.fish"

# Shortcuts
alias x='exit'
alias cl='clear'
alias cls='clear'
alias lsl='ls -la'
alias lsa='ls -a'
alias c.='pwd | clip'
alias rmd='rm -rf'
alias up='trizen -Syu'
alias sup='trizen -Syu --noconfirm'

# Presets
alias ls='ls --color=auto'

# Load fish
# alias ff='exec fish'

# Environment variables
# export PATH="$HOME/.cargo/bin:$PATH" # Rust binaries
export PATH="$PATH:$HOME/go/bin"			# Go binaries
export GOPATH="$HOME/go:/tmp/trizen-dtg"		# Go PATH

# setup Git SSH keys
# function gssh {
#   ssh-add &>/dev/null || eval `ssh-agent` &>/dev/null  # start ssh-agent if not present
#   [ $? -eq 0 ] && {                                    # ssh-agent has started
#     ssh-add ~/.ssh/your_private.key1 &>/dev/null       # Load key 1
#   # ssh-add ~/.ssh/your_private.key2 &>/dev/null       # Load key 2
#   }
# }

# Resources
# https://stackoverflow.com/questions/29667714/convert-bash-function-to-fishs
