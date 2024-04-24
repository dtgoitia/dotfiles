# =============================================================================
#
#    ~/.bashrc
#
# =============================================================================

echo "[$(date +%Y-%m-%d" "%T)] loading $BASH_SOURCE"

# tmux reads this environment variable to set its default shell
# rationale: Linux and Mac locate binaries in a different place
export TMUX_SHELL=$(which fish)

# If is not interactive shell, return
[[ $- != *i* ]] && return

if [[ -z "$TMUX" ]]; then
    tmux attach || tmux
fi
