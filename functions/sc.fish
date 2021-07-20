function sc --wraps systemctl

    set --local _sc_user_command \
        list-units list-sockets is-active status show help list-unit-files \
        is-enabled list-jobs show-environment cat list-machines

    set --local _sc_root_command \
        start stop reload restart try-restart isolate kill \
        reset-failed enable disable reenable preset mask unmask \
        link load cancel set-environment unset-environment \
        edit daemon-reload daemon-reexec

    if test (count $argv) -eq 0
        systemctl --help
        return
    end

    if contains $argv[1] $_sc_user_command
        systemctl $argv
    else if contains $argv[1] $_sc_root_command
        sudo systemctl $argv
    else
        systemctl --help
    end

end
