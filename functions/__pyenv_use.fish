function __pyenv_use
    if test -z "$argv"
        printf "Please specify the name of virtual environment.\n"
        printf "Try \e[1;32mpyenv\e[0m \e[1;96m--list\e[0m "
        printf "to see available virtual environment.\n"
    else if set i (contains -i -- "--cwd" $argv)
        set -e -- argv[$i]
        __pyenv_use_verify $argv
    else
        set -l env $HOME/.local/lib/pyenvs/$argv
        __pyenv_use_verify $env
    end
end
