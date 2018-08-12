# Load Powerline
set fish_function_path $fish_function_path "/usr/lib/python3.7/site-packages/powerline/bindings/fish"
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

# VSCH
alias v='vcsh dotfiles'
alias vs='vcsh dotfiles status'
alias va='vcsh dotfiles add'
alias vc='vcsh dotfiles commit'
alias vl='vcsh dotfiles log --oneling --all --graph --decorate'

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

# Presets
alias ls='ls --color=auto'

# Environment variables
# export PATH="$HOME/.cargo/bin:$PATH" # Rust binaries
export PATH="$PATH:$HOME/go/bin"			# Go binaries
export GOPATH="$HOME/go:/tmp/trizen-dtg"		# Go PATH

