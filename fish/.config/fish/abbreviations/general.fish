set DROPBOX_DIR "$HOME/Dropbox/projects-dropbox"

abbr --add rmd rm -rf

abbr --add e nautilus
abbr --add cl clear
abbr --add clr clear
abbr --add cls clear

abbr --add pi "ping 8.8.4.4 | xargs -L 1 -I '{}' date '+%Y-%m-%d %H:%M:%S {}'"

abbr --add au "aurman -Syu"
abbr --add aun "aurman -Syu --noconfirm"

abbr --add co "code-insiders ."

abbr --add dro "cd $DROPBOX_DIR"
abbr --add travel "code-insiders $DROPBOX_DIR/travelling"
abbr --add health "code-insiders $DROPBOX_DIR/health"
abbr --add wip "code-insiders $DROPBOX_DIR/WIP_TODOs.md"
abbr --add fi "code-insiders $DROPBOX_DIR/health/fitness"
abbr --add fitness "code-insiders $DROPBOX_DIR/health/fitness"
