function path
    if test -z "$argv"
        __path_show
        return
    end

    if not functions -q __path_"$argv[1]"
        printf "\e[1;91m%s\e[0m \e[1mnot an operation\e[0m\n\n" $argv
        __path_help
        return 1
    end

    __path_"$argv[1]" $argv[2..]
end
