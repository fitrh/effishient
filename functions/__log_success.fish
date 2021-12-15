function __log_success
    if test -z "$argv"
        return 0
    end

    printf "\e[1;92m%s\e[0m " $argv
    printf "\n"
end
