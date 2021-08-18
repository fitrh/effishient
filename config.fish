set -l CONFIG_DIR $HOME/.config/starship
set -l PROMPT_THEME $CONFIG_DIR/default.toml
set -gx STARSHIP_CONFIG $PROMPT_THEME

starship init fish | source
direnv hook fish | source
