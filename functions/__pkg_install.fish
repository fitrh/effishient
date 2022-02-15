function __pkg_install
    if test -z "$argv"
        printf "Please specify package(s) to install\n"
        return 1
    end

    if contains -- --aur $argv
        set PKG (__pkg_sanitize_args "--aur" $argv)
        paru \
            -S \
            --needed \
            --aur \
            --cleanafter \
            --removemake $PKG
        return
    end

    sudo pacman -S --needed $argv
end
