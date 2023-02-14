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
        case cache
            __pkg_cache $argv[2..]
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
