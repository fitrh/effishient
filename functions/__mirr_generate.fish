function __mirr_generate
    if test -z "$argv"
        sudo reflector --download-timeout $MIRR_TIMEOUT \
            -l $MIRR_INSTANCE -f $MIRR_INSTANCE \
            --protocol https,http \
            --sort rate --verbose --save $MIRR_MIRRORS
        return
    end

    __mirr_parse_args $argv
    sudo reflector --download-timeout $MIRR_TIMEOUT \
        -c $MIRR_COUNTRY -l $MIRR_INSTANCE -f $MIRR_INSTANCE \
        --protocol http,https \
        --sort rate --verbose --save $MIRR_MIRRORS
end
