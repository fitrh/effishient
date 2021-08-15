function mon --wraps btm
    set --local COMMAND btm
    set --local CONF_DIR ~/.config/bottom

    if test -z $argv
        $COMMAND --config $CONF_DIR/custom.toml
        return
    end

    set --local AVAILABLE_OPT $CONF_DIR/*.toml
    if test -n (string match "*$argv[1].toml" $AVAILABLE_OPT)
        $COMMAND --config $CONF_DIR/$argv[1].toml
    else
        $COMMAND $argv
    end
end
