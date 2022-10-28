function __log_show
    set COLOR $argv[1]
    set LABEL $argv[2]
    set MSG $argv[3..]

    printf "\e[0;%dm%s\e[0m \e[1;37m%b\e[0m " $COLOR $LABEL $MSG
    printf "\n"
end
