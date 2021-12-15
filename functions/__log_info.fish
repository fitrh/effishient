function __log_info
    if test -z "$argv"
        return 0
    end

    printf "\e[1;94m%s\e[0m " $argv
    printf "\n"
end
