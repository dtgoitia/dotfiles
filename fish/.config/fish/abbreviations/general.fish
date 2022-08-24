set DROPBOX_DIR "$HOME/Dropbox/projects-dropbox"

abbr --add rmd rm -rf

abbr --add e nautilus
abbr --add cl clear
abbr --add clr clear
abbr --add cls clear

abbr --add pi "ping 8.8.4.4 | xargs -L 1 -I '{}' date '+%Y-%m-%d %H:%M:%S {}'"

abbr --add au "aurman -Syu"
abbr --add aun "aurman -Syu --noconfirm"

# Open the IDE specified in the `IDE` env var, or default to VSCode
function open-ide
    if set -q IDE
        $IDE $argv &
    else
        code-insiders $argv
    end
end
abbr --add co "open-ide ."

abbr --add dro "cd $DROPBOX_DIR"
abbr --add job "code-insiders $DROPBOX_DIR/job"
abbr --add travel "code-insiders $DROPBOX_DIR/travelling"
abbr --add health "code-insiders $DROPBOX_DIR/health"
abbr --add wip "code-insiders $DROPBOX_DIR/WIP_TODOs.md"
abbr --add archive "code-insiders $DROPBOX_DIR/archived_TODOs.md"
abbr --add fi "code-insiders $DROPBOX_DIR/health/fitness"
abbr --add fitness "code-insiders $DROPBOX_DIR/health/fitness"
abbr --add finance "cd $HOME/projects/ledger-data && code-insiders . && code-insiders ./journals/journal.ledger"

# Work notes
set NOTES_DIR "$DROPBOX_DIR/job/notes"
set CSS_DIR "$DROPBOX_DIR/job/notes/2021-08-hiru-css"
abbr --add css "cd $CSS_DIR && code-insiders $CSS_DIR && code-insiders $CSS_DIR/hiru-css-joblog.md"
set BBM_DIR "$DROPBOX_DIR/job/notes/2022-02-hiru-bought-by-many"
abbr --add bbm "cd $BBM_DIR && code-insiders $BBM_DIR && code-insiders $BBM_DIR/joblog/hiru-bbm-joblog.md"

set DRAW_DIR "$DROPBOX_DIR/drawing"
abbr --add draw "cd $DRAW_DIR && code-insiders $DRAW_DIR && code-insiders $DRAW_DIR/drawing-log.md"

# Clean up variables
set --erase DROPBOX_DIR NOTES_DIR BBM_DIR DRAW_DIR

# nnn
abbr --add n "nnn -e"

# tmux
abbr --add s "tmux split-window -v -p 10 \;"

# remap keys
abbr --add re "remap_keys_altgr_hjkl_to_arrows.sh"
abbr --add rem "remap_keys_altgr_hjkl_to_arrows.sh"
