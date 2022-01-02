function __pyenv_use_verify
    if test -d $argv
        if test -d $argv/bin
            if test -f $argv/bin/activate.fish
                . $argv/bin/activate.fish
                return 0
            end
        end
    else
        printf "\e[1;31m%s\e[0m not a valid virtual environment.\n" $argv
    end
    return 1
end
