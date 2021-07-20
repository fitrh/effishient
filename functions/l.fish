function l --wraps exa
    exa --long --git \
        --colour-scale --icons \
        --group-directories-first \
        $argv
end
