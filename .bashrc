# =============================================================================
#
#    ~/.bashrc
#
# =============================================================================

echo "[$(date +%Y-%m-%d" "%T)] .bashrc (linux) file loaded from Dropbox"

# Constants
export LINUX_OS="linux-gnu"
export WINDOWS_OS="msys"

# Environment variables
export PATH="$HOME/.cargo/bin:$PATH"            # Rust binaries
export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"   # Ruby binaries
export PATH="$PATH:$HOME/go/bin"                # Go binaries
export GOPATH="$HOME/go:/tmp/trizen-dtg"        # Go PATH

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
if [[ "$OSTYPE" == "$WINDOWS_OS" ]]; then
    export DTG_SSH_KEY_PATH="$HOME/.ssh/id_rsa_dtgoitia"
    indent="  >"

    function ssh_reconnect () {
        # $1 - verbose mode ("-v")
        #
        # Look for all already initialized SSH agents
        # Iterate over each initialized SSH agent found
        # Set the SSH_AUTH_SOCK env var with the found SSH agent path
        # Try to list added fingerprints
        # If no fingerprints are found, the SSH agent is stale. Delete it.
        # TODO: finish with this function
        #
        # Insipired by https://gist.github.com/akabos/4266975
        if [[ "$1" == "-v" ]]; then
            echo "Reconnecting to a SSH Agent..."
        fi
        for agent in /tmp/ssh-*/agent.*; do
            export SSH_AUTH_SOCK=$agent
            if [[ "$agent" == "/tmp/ssh-*/agent.*" ]]; then
                # Nothing found, do nothing
                :
            elif ssh-add -l 2>&1 > /dev/null; then
                # Try to reuse the initialized SSH agent
                if [[ "$1" == "-v" ]]; then
                    echo "$indent Found working SSH Agent at $agent"
                fi
                # ssh-add -l  # TODO: is this needed?
                return
            else
                # Initialized SSH agent is stale. Delete it
                ssh_auth_sock_dir=$(echo $agent | sed -E 's/(\/tmp\/ssh.*\/)agent\..*/ \1 /')
                if [[ "$1" == "-v" ]]; then
                    echo "$indent Deleting non working SSH Agent: $ssh_auth_sock_dir"
                fi
                rm -rf $ssh_auth_sock_dir  # TODO: remove
            fi
        done

        if [[ "$1" == "-v" ]]; then
            echo "$indent No working SSH agent found"
        fi
        
        # Clean last stored SSH_AUTH_SOCK
        export SSH_AUTH_SOCK=""
    }

    function start_new_ssh_agent () {
        # $1 - verbose mode ("-v")
        if [[ "$1" == "-v" ]]; then
            echo "Starting a new SSH agent..."
        fi

        # output=$((eval $(ssh-agent -s)) 2>&1)
        eval $(ssh-agent -s)

        if [[ "$1" == "-v" ]]; then
            echo "$indent $output"
            echo "$indent SSH_AUTH_SOCK=$SSH_AUTH_SOCK"
        fi
    }

    function add_key_to_ssh_agent () {
        # $1 - verbose mode ("-v")
        if [[ "$1" == "-v" ]]; then
            echo "Adding key to SSH agent..."
        fi

        if [[ ! "$DTG_SSH_KEY_PATH" ]]; then
            echo "$indent DTG_SSH_KEY_PATH environment variable is not defined"
            return 1
        elif [[ ! -e "$DTG_SSH_KEY_PATH" ]]; then
            echo "$indent '$DTG_SSH_KEY_PATH' file does not exist"
            return 1
        elif [[ ! -f "$DTG_SSH_KEY_PATH" ]]; then
            echo "$indent $DTG_SSH_KEY_PATH must be a file"
            return 1
        elif [[ "$1" == "-v" ]]; then
            echo "$indent SSH key found!"
            echo "$indent SSH key: $DTG_SSH_KEY_PATH"
            echo "$indent Adding key to the SSH agent..."
        else
            :
        fi

        ssh-add $DTG_SSH_KEY_PATH 2>/dev/null
    }

    function test_github_ssh_connection () {
        # $1 - verbose mode ("-v")
        github_ssh_path="git@github.com"
        if [[ "$1" == "-v" ]]; then
            echo "Testing your SSH connection with $github_ssh_path..."
        fi
        ssh -T $github_ssh_path
    }

    function setup_ssh () {
        # $1 - verbose mode ("-v")
        ssh_reconnect $1

        if [[ -z "$SSH_AUTH_SOCK" ]]; then
            start_new_ssh_agent $1
            add_key_to_ssh_agent $1
            test_github_ssh_connection $1
        fi
    }
    
    alias ssh-dtgoitia="setup_ssh"
    alias ssh_dtgoitia="setup_ssh"
fi
