function el --wraps=eza
    if command -q eza
        eza --icons --color-scale all \
            --group-directories-first \
            $argv
        return
    end

    if command -q exa
        exa --icons --color-scale \
            --group-directories-first \
            $argv
        return
    end

    command ls --color --group-directories-first -hp $argv
end
