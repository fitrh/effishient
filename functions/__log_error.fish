function __log_error
    if test -z "$argv"
        return 0
    end

    printf "\e[1;91m%s\e[0m " $argv
    printf "\n"
end
