# Load Powerline
set fish_function_path $fish_function_path "/usr/lib/python3.7/site-packages/powerline/bindings/fish"
powerline-setup

# Git
alias g='git' # Use 'g' as git (you still can use 'git')
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gpl='git pull'
alias gps='git push'
alias gch='git checkout'
alias gb='git branch'
alias gl='git log --oneline --all --graph --decorate'
alias gf='git fetch --all --prune'

# VSCH
alias v='vcsh dotfiles'
alias vs='vcsh dotfiles status'
alias va='vcsh dotfiles add'
alias vc='vcsh dotfiles commit'
alias vl='vcsh dotfiles log --oneline --all --graph --decorate'

# Applications
alias np='vim'
alias e='nautilus .'

# Reload BASH
alias brc="source ~/Dropbox/config/.bashrc"

# Shortcuts
alias cl='clear'
alias cls='clear'
alias rmd='rm -rf'

# Presets
alias ls='ls --color=auto'

# Environment variables
# export PATH="$HOME/.cargo/bin:$PATH" # Rust binaries
export PATH="$PATH:$HOME/go/bin"			# Go binaries
export GOPATH="$HOME/go:/tmp/trizen-dtg"		# Go PATH

