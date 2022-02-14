function __pyenv_list
    set -l dir $HOME/.local/lib/pyenvs
    if command -q exa
        exa --only-dirs --oneline --icons $dir
        return
    end
    ls -1 $dir
end
