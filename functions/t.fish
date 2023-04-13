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
        return
    end

    log e "\e[1;32mexa\e[0m or \e[1;32mtree\e[0m command not found"
    return 1
end
