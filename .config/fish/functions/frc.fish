# file name and function name must match
function frc --description 'Reload config.fish file'
    set CONFIG_PATH ~/.config/fish/config.fish
    echo 'reloading '$CONFIG_PATH
    source $CONFIG_PATH
end
