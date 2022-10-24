if status is-login
    if test \( -z "$WAYLAND_DISPLAY" \) -a \( "$XDG_VTNR" -eq 1 \)
        if test -f $XDG_CONFIG_HOME/river/start
            exec $XDG_CONFIG_HOME/river/start
        end
    else if test \( -z "$DISPLAY" \) -a \( "$XDG_VTNR" -le 4 \)
        set -l LOG_DIR $XDG_CACHE_HOME/xorg
        set -l LOG_FILE startx_(date +'%Y%m%d_%H%M%S').log
        set -l LOG $LOG_DIR/$LOG_FILE
        exec startx -- -keeptty &>$LOG
    end
end
