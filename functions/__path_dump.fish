function __path_dump --argument-names log_file
    set -l LOG_FILE $HOME"/.cache/path_"(date +'%H%M%S%s')".log"

    if test -z "$log_file"
        if ! test -e $log_file
            set LOG_FILE $log_file
        end
    end

    for var in $fish_user_paths
        printf "%s\n" $var >>$LOG_FILE
    end

    if test $status -eq 0
        printf "\e[92mSuccessfully\e[0m dump "
        printf "\e[93mfish_user_paths\e[0m to \e[1;94m%s\e[0m\n" $LOG_FILE
    end
end
