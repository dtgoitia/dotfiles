# =============================================================================
#
#    ~/.bashrc
#
# =============================================================================

echo "[$(date +%Y-%m-%d" "%T)] .bashrc (linux) file loaded from Dropbox"

# Constants
readonly LINUX_OS="linux-gnu"
readonly WINDOWS_OS="msys"

# Environment variables
export PATH="$HOME/.cargo/bin:$PATH"            	# Rust binaries
export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"   	# Ruby binaries
export PATH="$PATH:$HOME/go/bin"			# Go binaries
export GOPATH="$HOME/go:/tmp/trizen-dtg"		# Go PATH

if [[ "$OSTYPE" == "$LINUX_OS" ]]; then
    export GEM_HOME=$(ruby -e 'print Gem.user_dir') 	# Bundle configuration
    export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin" # TODO: necessary?
fi

# BASH settings
if [[ -n "$BASH" ]]; then
    # Set up reload function only if current shell is BASH
    BASHRC_PATH="$HOME/.bashrc"
    function brc () {
        if [[ -f "$BASHRC_PATH" ]]; then
            source $BASHRC_PATH
        else
            echo "File '$BASHRC_PATH' does not exist or is not readable."
        fi
    }
fi

# If Linux, load tmux and abort current file loading
if [[ "$OSTYPE" == "$LINUX_OS" ]]; then
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
alias gch='git checkout'
alias gb='git branch'
alias gf='git fetch --all --prune'
alias gl='git log --oneline --all --graph --decorate'

# Applications
if [[ "$OSTYPE" == "$LINUX_OS"  ]]; then
    alias np='vim'
    alias e='nautilus .'
elif [[ "$OSTYPE" == "$WINDOWS_OS"  ]]; then
    alias e='explorer'
    alias browser='firefox'
    alias notepad='"C:\Program Files (x86)\Notepad++\notepad++.exe"'
    alias np='notepad'
    alias firefox='"C:\Program Files\Firefox Developer Edition\firefox.exe"'
    alias meld='"C:\Program Files (x86)\Meld\Meld.exe"'
fi

# General aliases
alias cls='clear'
alias cl='clear'
alias la='ls -la'
alias ls='ls --color=auto'
alias rmd='rm -rf'

# Load fish
if [[ "$OSTYPE" == "$LINUX_OS"  ]]; then
    alias np='vim'
    alias e='nautilus .'
    alias ff='exec fish'
fi

# Powerline
if [[ "$OSTYPE" == "$LINUX_OS"  ]]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
fi

# nnn configuration
if [[ "$OSTYPE" == "$LINUX_OS"  ]]; then
    export NNN_USE_EDITOR=1
    export VISUAL=vim
    export NNN_RESTRICT_NAV_OPEN=1
fi

# SSH
# function gssh {
#   ssh-add &>/dev/null || eval `ssh-agent` &>/dev/null  # start ssh-agent if not present
#   [ $? -eq 0 ] && {                                    # ssh-agent has started
#     ssh-add ~/.ssh/your_private.key1 &>/dev/null       # Load key 1
#   # ssh-add ~/.ssh/your_private.key2 &>/dev/null       # Load key 2
#   }
# }
# SSH
if [[ "$OSTYPE" == "$WINDOWS_OS" ]]; then
    # Look for all already initialized SSH agents
    # Iterate over each initialized SSH agent found
    # Set the SSH_AUTH_SOCK env var with the found SSH agent path
    # Try to list added fingerprints
    # If no fingerprints are found, the SSH agent is stale. Delete it.
    # TODO: finish with this function
    #
    # Insipired by https://gist.github.com/akabos/4266975
    ssh-reagent () {

        for agent in /tmp/ssh-*/agent.*; do
            export SSH_AUTH_SOCK=$agent
      # Try to reuse the initialized SSH agent
            if ssh-add -l 2>&1 > /dev/null; then
                echo Found working SSH Agent:
                ssh-add -l
                return
            # Initialized SSH agent is stale. Delete it
      else
          SSH_AUTH_SOCK_DIR=$(echo $SSH_AUTH_SOCK | sed -E 's/(\/tmp\/ssh.*\/)agent\..*/ \1 /')
    echo Deleting non working SSH Agent: $SSH_AUTH_SOCK_DIR
    rm -rf $SSH_AUTH_SOCK_DIR
            fi
        done
        echo Cannot find ssh agent - maybe you should reconnect and forward it?
    } 
  
  function ssh-setup () {
    # First argument ($1) = id_rsa
    id_rsa_dtgoitia
    echo ""
    echo Starting the SSH agent in the background...
    eval $(ssh-agent -s)
    echo ""
    echo Adding $1 key to SSH agent...
    ssh-add ~/.ssh/$1
    echo ""
    echo Testing your SSH connection...
    ssh -T git@github.com
  }
  
  alias ssh-dtgoitia="ssh-setup id_rsa_dtgoitia"
fi

