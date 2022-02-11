function __g_init
    set DIR (basename (pwd))
    if not git init $argv
        printf "\n\e[1;31mFAILED\e[0m: Init \e[1m%s\e[0m as git repository\n" $DIR
        return 1
    end
    printf "\n\e[1;32mSUCCESS\e[0m: Init \e[1m%s\e[0m as git repository\n" $DIR

    if not touch .gitignore
        printf "\e[1;31mFAILED\e[0m: Create \e[1m.gitignore\e[0m\n"
        return 1
    end
    printf "\e[1;32mSUCCESS\e[0m: Create \e[1m.gitignore\e[0m\n\n"
    printf "Let's \e[1;32madd\e[0m, \e[1;34mcommit\e[0m, and \e[1mpush\e[0m\n\n"
end
