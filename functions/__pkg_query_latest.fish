function __pkg_query_latest
    function _cmd
        expac --timefmt='%Y-%m-%d %T' '%l\t%n' |
            sort | tail -n $argv
    end

    if test -z "$argv"
        _cmd 20
        return
    end

    if ! string match -qr "(\d)+\$" $argv[1]
        printf "\nUsage : "
        printf "\e[1;32mpkg \e[1;36mquery \e[1;34mlatest \e[3;33mN\e[0m\n\n"
        printf "where \e[1;3;33mN\e[0m must an integer\n\n"
        return 1
    end

    _cmd $argv
    functions -e _cmd

end
