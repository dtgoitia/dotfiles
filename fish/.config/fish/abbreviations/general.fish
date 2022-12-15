set DROPBOX_DIR "$HOME/Dropbox"
set DROPBOX_PROJECTS_DIR "$DROPBOX_DIR/projects-dropbox"
set SECOND_BRAIN_DIR "$DROPBOX_DIR/second-brain"

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
abbr --add job "code-insiders $DROPBOX_PROJECTS_DIR/job"
abbr --add travel "code-insiders $DROPBOX_PROJECTS_DIR/travelling"
abbr --add health "code-insiders $SECOND_BRAIN_DIR/health"
abbr --add nutrition "code-insiders $SECOND_BRAIN_DIR/health/nutrition"
abbr --add fitness "code-insiders $SECOND_BRAIN_DIR/health/fitness"
abbr --add wip "code-insiders $DROPBOX_PROJECTS_DIR/WIP_TODOs.md"
abbr --add archive "code-insiders $DROPBOX_PROJECTS_DIR/archived_TODOs.md"
abbr --add finance "cd $HOME/projects/ledger-data && code-insiders . && code-insiders ./journals/journal.ledger"
abbr --add brain "code-insiders $DROPBOX_DIR/second-brain"

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

# Daily helpers
abbr --add morning_countdown "at 9.00am 30 minutes && at 9.15am 15 minutes && at 9.25am 5 minutes && at 9.28am 2 minutes && at 9.29am 1 minute && at 9.30am start"
