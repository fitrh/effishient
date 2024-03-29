function l --wraps eza
    if command -q eza
        eza --long --git \
            --colour-scale all --icons \
            --group-directories-first \
            $argv
        return
    end

    if command -q exa
        exa --long --git \
            --colour-scale --icons \
            --group-directories-first \
            $argv
        return
    end

    command ls --color --group-directories-first -hp -l $argv
end
