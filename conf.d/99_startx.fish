# Start X at login
if status is-login
    if test \( -z "$DISPLAY" \) -a \( "$XDG_VTNR" -le 5 \)
        set -l LOG_DIR $XDG_CACHE_HOME/xorg
        set -l LOG_FILE startx_(date +'%Y%m%d_%H%M%S').log
        set -l LOG $LOG_DIR/$LOG_FILE
        exec startx -- -keeptty &>$LOG
    end
end
