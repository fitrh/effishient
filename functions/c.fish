function c --wraps cd
    set _DIR "."
    if test -n "$argv"
        set _DIR $argv[1]
    end

    if not test -d $_DIR
        printf "Directory \e[1;31;40m $_DIR \e[0m doesn't exist\n"
        return 1
    end

    cd $_DIR
    if command -q exa
        exa -l --icons --group-directories-first -h
    else
        command ls --color --group-directories-first -hp
    end
end
