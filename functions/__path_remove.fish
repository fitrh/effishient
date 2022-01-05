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
