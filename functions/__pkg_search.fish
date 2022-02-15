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
