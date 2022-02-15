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
