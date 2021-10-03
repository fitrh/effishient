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

function __path_show
    set -l pad (string length (count $fish_user_paths))"d"
    for i in (seq (count $fish_user_paths))
        printf "\e[1;32m[%$pad] \e[0;94m%s\e[0m\n" $i $fish_user_paths[$i]
    end
end

function __path_add
    if test -z "$argv"
        printf "\e[0;31mPlease specify path(s) to add.\e[0m\n"
        return 1
    end

    if ! test -e $argv
        printf "\e[1;31m$argv\e[0m does not exist\n"
        return 1
    end

    if ! test -d $argv
        printf "\e[1;31m$argv\e[0m is not a directory\n"
        return 1
    end

    if contains -- "$argv" $fish_user_paths
        printf "\e[1;32m%s\e[0m already exist in PATH\n" $argv
        return 1
    end

    if set -Ua fish_user_paths $argv
        printf "\e[1;32m%s\e[0m successfully added to PATH\n" $argv
    end
end

function __path_add_to --argument-names index path
    set -l TEMP_PATH $fish_user_paths[$index..]

    for i in (seq (count $fish_user_paths) -1 $index)
        if ! set -eU fish_user_paths[$i]
            printf "Failed to remove \e[1;32m%s\e[0m\n" $fish_user_paths[$i]
            return 1
        end
    end

    __path_add $path

    for var in $TEMP_PATH
        if ! set -Ua fish_user_paths $var
            printf "Failed to add \e[1;32m%s\e[0m to PATH\n" $var
        end
    end
end

function __path_dump --argument-names log_file
    set -l LOG_FILE $HOME"/.cache/path_"(date +'%H_%M_%S_%s')".log"

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

function __path_remove
    if test -z "$argv"
        printf "\e[0;31mPlease specify path(s) index to remove.\e[0m\n"
        printf "See \e[0;32mpath show.\e[0m\n"
        return 1
    end

    for i in $argv
        set IDX $i

        # if $i is not a number, then remove path by it's name
        if ! string match -qr "(\d)+\$" $i
            # find the index of string $i inside $fish_user_paths
            if ! set IDX (contains -i -- "$i" $fish_user_paths)
                printf "\e[92m%s \e[91mnot found\e[0m in \$PATH\n" $i
                return 1
            end
        end

        set -l removed $fish_user_paths[$IDX]
        if set -eU fish_user_paths[$IDX]
            printf "\e[0;32m%s\e[0m removed from PATH.\n" $removed
        end
    end
end

function __path_help
    printf "Usage : \e[1;32mpath \e[1;96moperation "
    printf "\e[1;94m<option>\e[0m \e[1;93mentrie\e[0m\n\n"
    printf "Available operation :\n\n"
    printf "\t\e[1madd\e[0m      : add \e[1;93mentrie\e[0m to "
    printf "\e[91m\$PATH\e[0m\n"
    printf "\t\e[1maddto \e[1;94mi\e[0m  : add \e[1;93mentrie\e[0m to "
    printf "\e[91m\$PATH\e[0m at index \e[1;94mi\e[0m\n"
    printf "\t\e[1mdump \e[1;94mlog\e[0m : dump all entries in "
    printf "\e[91m\$PATH\e[0m to \e[1;94mlog\e[0m\n"
    printf "\t\t   if \e[1;94mlog\e[0m omitted, \e[1;94mlog\e[0m default to "
    printf "\e[91m\$XDG_CACHE_HOME\e[0m\n"
    printf "\t\e[1mremove\e[0m   : remove \e[1;93m[entrie..]\e[0m from "
    printf "\e[91m\$PATH\e[0m\n\t\t   \e[1;93mentrie\e[0m "
    printf "can be a list of index or path\n"
    printf "\t\e[1mshow\e[0m     : show all \e[91m\$PATH\e[0m entries\n"
    printf "\t\e[1mh\e[0m, \e[1mhelp\e[0m  : show this help\n"
    printf "\n"
end
