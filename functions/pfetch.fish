function pfetch
    set -gx PF_COL2 9

    if test -z $XDG_CURRENT_DESKTOP
        if test -z $DESKTOP_SESSION
            set -gx PF_INFO 'ascii title kernel os shell pkgs uptime wm'
        end
    else
        set -gx PF_INFO 'ascii title kernel os shell pkgs uptime de'
    end

    clear
    command pfetch $argv
end
