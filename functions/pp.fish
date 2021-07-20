function pp --wraps pip

    if ! command -q pip
        printf "Please activate or create virtual environment first.\n"
        printf "run : \033[0;92mpyenv --help\033[0;0m.\n"
        return
    end

    if test -z "$argv"
        pip --help
        return
    end

    switch $argv[1]
        case f freeze
            pip freeze $argv[2..]
        case i install
            pip install -U $argv[2..]
            pip freeze >~/.cache/pyenv/freeze_(date +'%Y%m%d_%H%M%S').log
        case l list
            __pp_list $argv[2..]
        case o outdate
            pip list -o --format=freeze $argv[2..]
        case pip
            pip install --upgrade pip $argv[2..]
        case s show
            pip show -v $argv[2..]
        case u uninstall
            pip uninstall $argv[2..]
        case up upgrade
            __pp_upgrade $argv[2..]
        case '*'
            pip $argv
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

    pip list --format=$FORMAT
end

function __pp_upgrade
    set -l CACHE "$HOME/.cache/pyenv"
    if pip list -o --format=json | jq -r .[].name >outdate.txt
        if pip install -Ur outdate.txt
            if rm -rf outdate.txt
                pip freeze >"$CACHE/freeze_"(date +'%Y%m%d_%H%M%S')".log"
            end
        end
    end
end
