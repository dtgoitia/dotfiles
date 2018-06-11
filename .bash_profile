#
# ~/.bash_profile
#
echo 'bash_profile loaded --------------------------------'
[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

echo ".bash_profile loaded"
