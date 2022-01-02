function __pyenv_create_success
    printf "\e[1;92m%s\e[0m " $argv[1]
    printf "successfully created as virtual environment.\n"
    printf "Run \e[1;92mpyenv --use %s%s\e[0m to use it.\n" $argv[2] $argv[1]
end
