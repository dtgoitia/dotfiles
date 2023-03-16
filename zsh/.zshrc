# Log loading time and source
echo "[$(date +%Y-%m-%d" "%T)] loading $PWD/.zshrc"

export TMUX_SHELL=$(which fish)

tmux
