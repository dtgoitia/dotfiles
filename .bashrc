# This file is located within Dropbox
echo ".bashrc (linux) file loaded from Dropbox"

# If Linux, load tmux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	tmux
fi

# Git
complete -o default -o nospace -F _git g # Autocomplete for 'g' as well
alias g='git' # Use 'g' as git (you still can use 'git')
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gpl='git pull'
alias gps='git push'
alias gl='git log --oneline --all --graph --decorate'


# Applications
if [[ "$OSTYPE" == "linux-gnu"  ]]; then
	alias np='vim'
	alias e='nautilus .'
elif [[ "$OSTYPE" == "win32"  ]]; then
	alias meld='"C:/Program Files (x86)/Meld/meld/meld.exe"'
	alias notepad='"C:/Program Files (x86)/Notepad++/notepad++.exe"'

# Reload BASH
alias brc="source ~/Dropbox/config/.bashrc"
alias settings="np ~/Dropbox/config/.bashrc"

# Shortcuts
alias x='exit'
alias cl='clear'
alias cls='clear'
alias la='ls -la'
alias c.='pwd | clip'
alias rmd='rm -rf'

# Presets
alias ls='ls --color=auto'

# Load fish
alias ff='exec fish'

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

# nnn configuration
export NNN_USE_EDITOR=1
export VISUAL=vim
export NNN_RESTRICT_NAV_OPEN=1

# Environment variables
export PATH="$HOME/.cargo/bin:$PATH"            	# Rust binaries
export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"   	# Ruby binaries
export GEM_HOME=$(ruby -e 'print Gem.user_dir') 	# Bundle configuration
export PATH="$PATH:$HOME/go/bin"			# Go binaries
export GOPATH="$HOME/go:/tmp/trizen-dtg"		# Go PATH

# setup Git SSH keys
function gssh {
  ssh-add &>/dev/null || eval `ssh-agent` &>/dev/null  # start ssh-agent if not present
  [ $? -eq 0 ] && {                                    # ssh-agent has started
    ssh-add ~/.ssh/your_private.key1 &>/dev/null       # Load key 1
  # ssh-add ~/.ssh/your_private.key2 &>/dev/null       # Load key 2
  }
}

