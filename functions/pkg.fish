function __pkg_sanitize_args
    set TO_SANITIZE $argv[1]
    set ARGS $argv[2..]
    if set IDX (contains -i -- "$TO_SANITIZE" $ARGS)
        set -e -- ARGS[$IDX]
    end
    printf "%s" $ARGS
end

function __pkg_usage
    printf "\nUsage:\n\n"
    printf "    \e[1;32mpkg\e[0m "
    printf "<\e[1;36moperation\e[0m> "
    printf "<\e[1;34moption\e[0m> "
    printf "<\e[1;33mpackage\e[0m(\e[1;33ms\e[0m)>\n\n"
end

function __pkg_zero_arguments
    printf "Available operation :\n\n"
    printf "    i, install\t: sudo pacman -Su\n"
    printf "    u, update\t: sudo pacman -Syu\n"
    printf "    s, search\t: pacman -Ss\n"
    printf "    sy, sync\t: pacman -Syy\n"
    printf "    info\t: pacman -Sii\n"
    printf "    c, clean\t: clean cache packages at /var/cache/pacman/pkg\n"
    printf "\t\t  but keep the latest version of installed package.\n"
    printf "    r, remove\t: sudo pacman -Rnssucv\n"
    printf "    q, query\t: pacman -Qs, if no package(s) or argument(s) given\n"
    printf "    h, help\t: Show this help\n\n"
    printf "Available option :\n\n"
    printf "    --aur\t: target for AUR\n"
    printf "    --agr\t: for \e[1;36mclean\e[0m opearation,\n"
    printf "\t\t  clean all cache with pacman -Scc.\n\n"
end

function __pkg_install
    if test -z "$argv"
        printf "Please specify package(s) to install\n"
        return 1
    end

    if contains -- --aur $argv
        set PKG (__pkg_sanitize_args "--aur" $argv)
        paru -S --needed --aur --cleanafter \
            --removemake $PKG
        return
    end

    sudo pacman -S --needed $argv
end

function __pkg_downgrade
    if test -z "$argv"
        printf "Please specify package(s) to downgrade\n"
        return 1
    end

    sudo pacman -U $argv
end

function __pkg_update
    if test -z "$argv"
        sudo pacman -Syu
        return
    end

    if contains -- --aur $argv
        set PKG (__pkg_sanitize_args "--aur" $argv)
        paru -Syu --needed --aur --cleanafter \
            --removemake $PKG
        return
    end

    sudo pacman -Syu --needed $argv
end

function __pkg_search
    if test -z "$argv"
        printf "Please specify package(s)\n"
        return 1
    end

    if contains -- --aur $argv
        set PKG (__pkg_sanitize_args "--aur" $argv)
        paru -Ss --aur $PKG
        return
    end

    pacman -Ss $argv
end

function __pkg_info
    if test -z "$argv"
        printf "Please specify package(s)\n"
        return 1
    end

    if contains -- --aur $argv
        set PKG (__pkg_sanitize_args "--aur" $argv)
        paru -Sii --aur $PKG
        return
    end

    pacman -Sii $argv
end

function __pkg_clean
    if test -z "$argv"
        sudo paccache -rk1 -ruk0
    end

    if contains -- --agr $argv
        set ARGS (__pkg_sanitize_args "--agr" $argv)
        sudo pacman -Scc $ARGS
        return
    end

    sudo pacman -Sc $argv
end

function __pkg_remove
    if test -z "$argv"
        printf "Please specify package(s)\n"
        return 1
    end

    sudo pacman -Rnssucv $argv
end

function __pkg_query_help
    printf "\nPlease specify package(s) or option\n"
    printf "If there are no option provided, it will run pacman -Qs\n"
    printf "which is will search from installed packages.\n"
    printf "\nQuery options:\n\n"
    printf "    e, explicit\t\t: List all explicitly installed packages\n"
    printf "\t\t\t  (installed from the sync database(s)).\n"
    printf "    en\t\t\t: List all explicitly installed native packages.\n"
    printf "    f, foreign\t\t: List all foreign packages\n"
    printf "\t\t\t  (installed from outside the sync database(s)).\n"
    printf "    g, group \e[3;32mgroup\e[0m\t: List all packages "
    printf "in the package group named \e[3;32mgroup\e[0m.\n"
    printf "    i, info \e[3;32mpkgs\e[0m\t: Display info "
    printf "of installed package(s) named \e[3;32mpkgs\e[0m.\n"
    printf "    l, latest \e[3;32mN\e[0m\t\t: List the \e[3;32mN\e[0m"
    printf "(default: 20) last installed packages.\n"
    printf "    n, native\t\t: List all native packages\n"
    printf "\t\t\t  (installed from the sync database(s)).\n"
    printf "    u, unused\t\t: List all unused packages (orphans).\n\n"
end

function __pkg_query_latest
    function _cmd
        expac --timefmt='%Y-%m-%d %T' '%l\t%n' |
            sort | tail -n $argv
    end

    if test -z "$argv"
        _cmd 20
        return
    end

    if ! string match -qr "(\d)+\$" $argv[1]
        printf "\nUsage : "
        printf "\e[1;32mpkg \e[1;36mquery \e[1;34mlatest \e[3;33mN\e[0m\n\n"
        printf "where \e[1;3;33mN\e[0m must an integer\n\n"
        return 1
    end

    _cmd $argv
    functions -e _cmd

end

function __pkg_query

    if test (count $argv) -eq 0
        __pkg_query_help
    else
        switch $argv[1]
            case explicit e
                pacman -Qe
            case en
                pacman -Qent
            case group g
                pacman -Sg $argv[2..-1]
            case foreign f
                pacman -Qm
            case info i
                pacman -Qi $argv[2..-1]
            case native n
                pacman -Qn
            case latest l
                __pkg_query_latest $argv[2..-1]
            case unused u
                pacman -Qtdq
            case '*'
                pacman -Qs $argv
        end
    end
end

function pkg --wraps pacman

    if test -z "$argv"
        __pkg_usage
        __pkg_zero_arguments
        return 1
    end

    switch $argv[1]
        case i install
            __pkg_install $argv[2..]
        case u update
            __pkg_update $argv[2..]
        case d downgrade
            __pkg_downgrade $argv[2..]
        case s search
            __pkg_search $argv[2..]
        case sy sync
            sudo pacman -Syy
        case info
            __pkg_info $argv[2..]
        case c clean
            __pkg_clean $argv[2..]
        case r remove
            __pkg_remove $argv[2..]
        case q query
            __pkg_query $argv[2..]
        case h help
            __pkg_usage
            __pkg_zero_arguments
        case '*'
            printf "Invalid arguments.\n"
            __pkg_zero_arguments
            return 1
    end
end
