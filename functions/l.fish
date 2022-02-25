function l --wraps exa
    if command -q exa
        exa --long --git \
            --colour-scale --icons \
            --group-directories-first \
            $argv
        return
    end
    command ls --color --group-directories-first -hp -l $argv
end
