function __log_trace
    if test -z "$argv"
        return 0
    end

    set LABEL $argv[1]
    set MSG $argv[2..]
    printf "\e[0;95m%s\e[0m \e[1;37m%s\e[0m " $LABEL $MSG
    printf "\n"
end
