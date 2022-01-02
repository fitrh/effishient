function __pyenv_create
    if test -z "$argv"
        printf "Please provide a name for virtual environment.\n"
        return 1
    else if set i (contains -i -- "--cwd" $argv)
        set -e -- argv[$i]
        if test -d $argv
            printf "\e[1;92m%s\e[0m is already exists.\n" $argv
            return 1
        end
        if python -m venv $argv
            __pyenv_create_success $argv '--cwd '
        end
        return
    end

    set -l dir $HOME/.local/lib/pyenvs
    if test -d $dir/$argv[1]
        printf "\e[1;92m%s\e[0m is already exists.\n" $argv[1]
        return 1
    end
    if python -m venv $dir/$argv[1]
        __pyenv_create_success $argv[1]
    end
end
