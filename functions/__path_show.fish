function __path_show
    set -l pad (string length (count $fish_user_paths))"d"
    for i in (seq (count $fish_user_paths))
        printf "\e[1;32m[%$pad] \e[0;94m%s\e[0m\n" $i $fish_user_paths[$i]
    end
end
