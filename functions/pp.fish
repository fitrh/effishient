function pp --wraps pip

    if ! command -q pip
        printf "Please activate or create virtual environment first.\n"
        printf "run : \033[0;92mpyenv --help\033[0;0m.\n"
        return
    end

    set CMD python -m pip

    if test -z "$argv"
        $CMD --help
        return
    end

    switch $argv[1]
        case dev
            $CMD install -U black flake8 isort mypy pylint pytest
        case f freeze
            $CMD freeze $argv[2..]
        case i install
            $CMD install -U pip
            $CMD install -U $argv[2..]
            $CMD freeze >~/.cache/pyenv/freeze_(date +'%Y%m%d_%H%M%S').log
        case l list
            __pp_list $argv[2..]
        case o outdate
            $CMD list -o --format=freeze $argv[2..]
        case pip
            $CMD install --upgrade pip $argv[2..]
        case s show
            $CMD show -v $argv[2..]
        case u uninstall
            $CMD uninstall $argv[2..]
        case up upgrade
            __pp_upgrade $argv[2..]
        case '*'
            $CMD $argv
    end

end

function __pp_list
    set -l FORMATS columns freeze json
    set -l FORMAT freeze

    if test -n "$argv"
        if contains -- "$argv[1]" $FORMATS
            set FORMAT $argv[1]
        end
    end

    python -m pip list --format=$FORMAT
end

function __pp_upgrade
    set -l CACHE "$HOME/.cache/pyenv"
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
