function tre --wraps=eza
    if command -q eza
        command eza --icons --color-scale all \
            --tree \
            --group-directories-first \
            $argv
        return
    end

    if command -q exa
        exa --icons --color-scale \
            --tree \
            --group-directories-first \
            $argv
        return
    end

    if command -q tree
        tree -CF --dirsfirst $argv
        return
    end

    log e "exa or tree command not found"
    return 1
end
