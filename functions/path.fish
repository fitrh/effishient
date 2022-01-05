function path
    if test -z "$argv"
        __path_show
        return
    end

    switch $argv[1]
        case add
            __path_add $argv[2..]
        case addto
            __path_add_to $argv[2..]
        case update
            __path_update $argv[2..]
        case dump
            __path_dump $argv[2..]
        case remove
            __path_remove $argv[2..]
        case show
            __path_show
        case h help
            __path_help
        case "*"
            printf "\e[1;91m%s\e[0m \e[1mnot an operation\e[0m\n\n" $argv
            __path_help
            return 1
    end
end
