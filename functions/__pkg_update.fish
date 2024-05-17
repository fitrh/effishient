function __pkg_update
    # To prevent the "Failed to commit transaction (invalid or corrupted package)" error
    # SEE: https://wiki.archlinux.org/title/Pacman#%22Failed_to_commit_transaction_(invalid_or_corrupted_package)%22_error
    # SEE: https://wiki.archlinux.org/title/Pacman/Package_signing#Upgrade_system_regularly
    sudo pacman -Sy --needed archlinux-keyring

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
