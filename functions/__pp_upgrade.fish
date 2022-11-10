function __pp_upgrade
    set -l CACHE "$HOME/.cache/pyenv"
    __pp_base
    if python -m pip list -o --format=json | jq -r .[].name >outdate.txt
        if python -m pip install -Ur outdate.txt
            if rm -rf outdate.txt
                set -l cache_file "freeze_"(date +'%Y%m%d_%H%M%S')".log"
                printf "# %s\n" $PWD >$CACHE/$cache_file
                python -m pip freeze >>$CACHE/$cache_file
            end
        end
    end
end
