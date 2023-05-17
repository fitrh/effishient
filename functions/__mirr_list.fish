function __mirr_list
    if test -z "$argv"
        reflector --download-timeout $MIRR_TIMEOUT \
            -l $MIRR_INSTANCE -f $MIRR_INSTANCE \
            --protocol http,https \
            --sort rate --verbose
        return
    end

    __mirr_parse_args $argv
    reflector --download-timeout $MIRR_TIMEOUT \
        -c $MIRR_COUNTRY -l $MIRR_INSTANCE -f $MIRR_INSTANCE \
        --sort rate --verbose \
        --protocol http,https
end
