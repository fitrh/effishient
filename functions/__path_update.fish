function __path_update
    if test -z "$argv"
        printf "Please specify \e[1;91m[index] [new path]\e[0m\n"
        return 1
    end

    if test $argv[1] -gt (count $fish_user_paths)
        printf "\e[1;91m[index]\e[0m out of bounds\n"
        return 1
    end

    if test -z "$argv[2]"
        printf "Please specify \e[1;91m[new path]\e[0m\n"
        return 1
    end

    set -l index $argv[1]
    set -l new_path $argv[2]

    if not set fish_user_paths[$index] $new_path
        printf "Failed to update %s to %s\n" $fish_user_paths[$index] $new_path
        return 1
    end

    path show
end
