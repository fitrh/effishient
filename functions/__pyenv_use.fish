function __pyenv_use
    if test -z "$argv"
        printf "Please specify the name of virtual environment.\n"
        printf "Try \e[1;32mpyenv\e[0m \e[1;96m--list\e[0m "
        printf "to see available virtual environment.\n"
        return 1
    end

    for pattern in "." --cwd
        if set i (contains -i -- "$pattern" $argv)
            set -l dirs (command ls -A)

            if contains -- venv in $dirs
                __pyenv_use_verify venv
                return
            end

            if contains -- ".venv" in $dirs
                __pyenv_use_verify ".venv"
                return
            end

            set -e -- argv[$i]
            __pyenv_use_verify $argv
            return
        end
    end

    set -l env $HOME/.local/lib/pyenvs/$argv
    __pyenv_use_verify $env
end
