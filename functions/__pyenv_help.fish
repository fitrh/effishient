function __pyenv_help
    printf "Usage : \e[1;32mpyenv\e[0m "
    printf "\e[1;96m<arguments>\e[0m "
    printf "\e[1;33m<environment directory>\e[0m\n"
    printf "Available arguments: \n"
    printf "    -c, --create\t: Create virtual environment\n"
    printf "    -l, --list\t\t: List available virtual environment\n"
    printf "    -u, --use\t\t: Use a virtual environment\n"
    printf "\t\t\t  \e[1;96m--list\e[0m to see available virtual environment\n"
    printf "    -h, --help\t\t: Show this help\n"
    printf "\n    available argument for "
    printf "\e[1;96m--create\e[0m & \e[1;96m--use\e[0m\n"
    printf "          --cwd\t\t: Create / Use virtual environment"
    printf " in current directory\n"
end
