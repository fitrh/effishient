set -l CONFIG_DIR $HOME/.config/starship
set -l PROMPT_THEME $CONFIG_DIR/default.toml
set -gx STARSHIP_CONFIG $PROMPT_THEME

if command -sq starship
    starship init fish | source
end

if command -sq direnv
    direnv hook fish | source
end
