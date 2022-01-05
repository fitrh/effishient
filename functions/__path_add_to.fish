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
