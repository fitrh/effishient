function __pkg_clean
    if test -z "$argv"
        sudo paccache -rk1 -ruk0 -v
    end

    if contains -- --agr $argv
        set ARGS (__pkg_sanitize_args "--agr" $argv)
        sudo pacman -Scc $ARGS
        return
    end

    sudo pacman -Sc $argv
end
