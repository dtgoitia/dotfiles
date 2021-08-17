# Log loading time and source
echo "[$(date +%Y-%m-%d" "%T)] loading $BASH_SOURCE"

# Load my own .bashrc
bashrc_path="$HOME/.bashrc"
[[ -f "$bashrc_path" ]] && . "$bashrc_path" || echo "$bashrc_path not found and could not load it"
