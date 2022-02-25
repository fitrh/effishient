function t --wraps=exa
    if command -q exa
        exa --icons --color-scale \
            --tree \
            --group-directories-first \
            --long --no-permissions --no-user --no-time --git \
            $argv
        return
    end

    if command -q tree
        tree -CF --dirsfirst $argv
    end

    log e "exa or tree command not found"
    return 1
end
