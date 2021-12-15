function __log_warn
    if test -z "$argv"
        return 0
    end

    printf "\e[1;93m%s\e[0m " $argv
    printf "\n"
end
