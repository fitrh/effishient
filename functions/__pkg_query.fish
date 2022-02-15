function __pkg_query
    if test -z "$argv"
        __pkg_query_help
        return 1
    end

    switch $argv[1]
        case explicit e
            pacman -Qe
        case en
            pacman -Qent
        case group g
            pacman -Sg $argv[2..]
        case foreign f
            pacman -Qm
        case info i
            pacman -Qi $argv[2..]
        case native n
            pacman -Qn
        case latest l
            __pkg_query_latest $argv[2..]
        case unused u
            pacman -Qtdq
        case '*'
            pacman -Qs $argv
    end
end
