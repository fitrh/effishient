function __pkg_remove
    if test -z "$argv"
        printf "Please specify package(s)\n"
        return 1
    end

    sudo pacman -Rnssucv $argv
end
