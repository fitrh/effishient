# Start X at login
if status is-login
    if test \( -z "$DISPLAY" \) -a \( "$XDG_VTNR" -le 3 \)
        set -l LOG_DIR $XDG_CACHE_HOME/xorg
        set -l LOG_FILE startx_(date +'%Y%m%d_%H%M%S').log
        set -l LOG $LOG_DIR/$LOG_FILE
        exec startx -- -keeptty &>$LOG
    else if test \( -z "$WAYLAND_DISPLAY" \) -a \( "$XDG_VTNR" -eq 4 \)
        $XDG_CONFIG_HOME/river/start
    end
end
