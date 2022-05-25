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
