function __pyenv_list
    set -l dir $HOME/.local/lib/pyenvs
    exa --only-dirs --oneline --icons $dir
end
