function t --wraps=exa
    exa --icons --color-scale \
        --tree \
        --group-directories-first \
        --long --no-permissions --no-user --no-time --git \
        $argv
end
