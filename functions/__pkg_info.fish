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
