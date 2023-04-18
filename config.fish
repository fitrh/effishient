if not status is-interactive
    return
end

if command -sq starship
    set -l CONFIG_DIR $HOME/.config/starship
    set -l PROMPT_THEME $CONFIG_DIR/default.toml
    set -x STARSHIP_CONFIG $PROMPT_THEME
    starship init fish | source
end

if command -sq zoxide
    zoxide init fish | source
end
