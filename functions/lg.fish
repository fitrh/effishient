function lg --wraps eza --description 'List files with git state'
    set -l cmd
    if command -q eza
        set cmd eza
    end

    if test \( -z cmd \) -a (command -q exa)
        set cmd exa
    end

    if test -z cmd
        log e "\e[1;34meza\e[0m or \e[1;34mexa\e[0m commands not found"
        return 1
    end

    "$cmd" \
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
