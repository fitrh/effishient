function el --wraps=exa
    if command -q exa
        exa --icons --color-scale \
            --group-directories-first \
            $argv
        return
    end
    command ls --color --group-directories-first -hp $argv
end
