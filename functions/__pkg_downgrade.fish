function __pkg_downgrade
    if test -z "$argv"
        printf "Please specify package(s) to downgrade\n"
        return 1
    end

    sudo pacman -U $argv
end
