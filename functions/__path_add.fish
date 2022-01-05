function __path_add
    if test -z "$argv"
        printf "\e[0;31mPlease specify path(s) to add.\e[0m\n"
        return 1
    end

    if not -e $argv
        printf "\e[1;31m$argv\e[0m does not exist\n"
        return 1
    end

    if not -d $argv
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
