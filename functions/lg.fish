function lg --wraps exa
    if not command -q exa
        log e "exa not found"
        return 1
    end

    exa \
        --long \
        --icons \
        --group-directories-first \
        --git \
        --git-ignore \
        --no-permissions \
        --no-user \
        --no-filesize \
        --no-time \
        $argv
end
