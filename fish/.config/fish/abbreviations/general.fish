set DROPBOX_DIR "$HOME/Dropbox"
set DROPBOX_PROJECTS_DIR "$DROPBOX_DIR/projects-dropbox"
set SECOND_BRAIN_DIR "$DROPBOX_DIR/second-brain"
set PROJECTS_DIR "$HOME/projects"

abbr --add rmd rm -rf

abbr --add e nautilus
abbr --add cl clear
abbr --add clr clear
abbr --add cls clear

abbr --add pi "ping 8.8.4.4 | xargs -L 1 -I '{}' date '+%Y-%m-%d %H:%M:%S {}'"

abbr --add au "aurman -Syu"
abbr --add aun "aurman -Syu --noconfirm"

function get_vscode_bin_name
    for bin_name in "code-insiders" "code"
        if type -q $bin_name
            echo $bin_name
            break
        end
    end
end

function cd_open_in_vscode_and_cd_back --argument-names base_dir file_path
    set original_dir (pwd)
    cd $base_dir
    $ide_bin_name $base_dir $file_path
    cd $original_dir
    set --erase original_dir
end

# Open the IDE specified in the `IDE` env var, or default to VSCode
function open-ide
    if set -q IDE
        $IDE $argv &
    else
        set vscode_bin_name (get_vscode_bin_name)
        $vscode_bin_name $argv
    end
end
abbr --add co "open-ide ."

set ide_bin_name (get_vscode_bin_name)

abbr --add dro "cd $DROPBOX_DIR"
abbr --add job "$ide_bin_name $DROPBOX_DIR/job"
abbr --add people "cd_open_in_vscode_and_cd_back $HOME/people $HOME/people/people.md"
abbr --add travel "$ide_bin_name $SECOND_BRAIN_DIR/travelling"
abbr --add health "$ide_bin_name $SECOND_BRAIN_DIR/health"
abbr --add nutrition "$ide_bin_name $SECOND_BRAIN_DIR/health/nutrition"
abbr --add fitness "$ide_bin_name $SECOND_BRAIN_DIR/health/fitness"
abbr --add wip "$ide_bin_name $PROJECTS_DIR/wipman-data"
abbr --add archive "$ide_bin_name $DROPBOX_PROJECTS_DIR/archived_TODOs.md"
abbr --add finance "cd $HOME/projects/ledger-data && $ide_bin_name . && $ide_bin_name ./journals/journal.ledger"
abbr --add brain "$ide_bin_name $SECOND_BRAIN_DIR"
abbr --add log "cd_open_in_vscode_and_cd_back $SECOND_BRAIN_DIR $SECOND_BRAIN_DIR/journal/log.md"

# Work notes
set YLD_DIR "$DROPBOX_DIR/job/notes/2023-01-hiru-yld-bulb"
abbr --add yld "cd_open_in_vscode_and_cd_back $YLD_DIR $YLD_DIR/joblog/hiru-yld-bulb-joblog.md"

set DRAW_DIR "$DROPBOX_DIR/drawing"
abbr --add draw "cd_open_in_vscode_and_cd_back $DRAW_DIR $DRAW_DIR/drawing-log.md"

# Clean up variables
set --erase DROPBOX_DIR \
            DROPBOX_PROJECTS_DIR \
            SECOND_BRAIN_DIR \
            PROJECTS_DIR \
            YLD_DIR \
            DRAW_DIR

# nnn
abbr --add n "nnn -e"

# tmux
abbr --add s "tmux split-window -v -p 10 \;"

# remap keys
abbr --add re "remap_keys_altgr_hjkl_to_arrows.sh"
abbr --add rem "remap_keys_altgr_hjkl_to_arrows.sh"

# Daily helpers
abbr --add morning_countdown "at 9.00am 30 minutes && at 9.15am 15 minutes && at 9.25am 5 minutes && at 9.28am 2 minutes && at 9.29am 1 minute && at 9.30am start"
