# =============================================================================
#
#    ~/.bashrc
#
# =============================================================================

echo "[$(date +%Y-%m-%d" "%T)] loading $BASH_SOURCE"

# If is not interactive shell, return
[[ $- != *i* ]] && return

if [[ -z "$TMUX" ]]; then
    tmux attach || tmux
fi
