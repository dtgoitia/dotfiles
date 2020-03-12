# =============================================================================
#
#    ~/.bash_profile
#
# =============================================================================

# Load my own .bashrc
source "$HOME/.bashrc"

# enable virtualenvwrapper if available
if [ -e /usr/local/bin/virtualenvwrapper.sh ]
then
    export WORKON_HOME=~/Envs
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='-p python3'
    source /usr/local/bin/virtualenvwrapper.sh
fi
