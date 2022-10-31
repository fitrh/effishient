function c --wraps cd
    set _DIR "."
    if test -n "$argv"
        set _DIR $argv[1]
    end

    if not test -d $_DIR
        log e "\e[1;31;40m $_DIR \e[0m doesn't exist as directory"
        return 1
    end

    cd $_DIR
    clear
    if command -q exa
        exa -l --icons --group-directories-first -h
        return 0
    end
    command ls --color --group-directories-first -hp
end
