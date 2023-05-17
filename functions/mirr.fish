function mirr
    set -g MIRR_COUNTRY Indonesia
    set -g MIRR_INSTANCE 5
    set -g MIRR_MIRRORS "/etc/pacman.d/mirrorlist"
    set -g MIRR_TIMEOUT 60

    if test -z "$argv"
        __mirr_help
        return
    end

    switch $argv[1]
        case -g --generate
            __mirr_generate $argv[2..]
        case -l --list
            __mirr_list $argv[2..]
        case -s --status
            echo "Current Mirror Status"
            tail -n +6 $MIRR_MIRRORS
        case -h --help
            __mirr_help
        case '*'
            echo "Invalid argument."
            __mirr_help
    end
end
