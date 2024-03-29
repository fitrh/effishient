function t --wraps=eza
    if command -q eza
        command eza --icons --color-scale all \
            --tree \
            --group-directories-first \
            --long --no-permissions --no-user --no-time --git \
            $argv
        return
    end

    if command -q exa
        exa --icons --color-scale \
            --tree \
            --group-directories-first \
            --long --no-permissions --no-user --no-time --git \
            $argv
        return
    end

    if command -q tree
        tree -h -F --du --dirsfirst -C $argv
        return
    end

    log e "\e[1;32meza\e[0m, \e[1;32mexa\e[0m or \e[1;32mtree\e[0m command not found"
    return 1
end
