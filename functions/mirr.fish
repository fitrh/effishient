function mirr
    set -g __COUNTRY Indonesia
    set -g __INSTANCE 5
    set -g __MIRRORS "/etc/pacman.d/mirrorlist"

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
            tail -n +6 $__MIRRORS
        case -h --help
            __mirr_help
        case '*'
            echo "Invalid argument."
            __mirr_help
    end
end
