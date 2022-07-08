function dotfile --wraps git
    switch $argv[1]
        case a
            __dotfile_cmd add $argv[2..]
        case d
            __dotfile_cmd diff $argv[2..]
        case dc
            __dotfile_cmd diff --cached $argv[2..]
        case s
            __dotfile_cmd status $argv[2..]
        case cm
            __dotfile_commit $argv[2..]
        case lop
            __dotfile_cmd log \
                --pretty="format:%C(bold yellow)%h %Creset%C(dim magenta)(%cd)%Creset %C(brightwhite)%<(70,trunc)%s%Creset %C(brightblack)ﰖ %C(blue)%<(15,trunc)%aN %C(brightblack)%<(15,trunc)%cr %C(bold red)%>(15,trunc)%D" \
                --date="format:%Y-%m-%d %H:%M" \
                $argv[2..]
        case patch
            __dotfile_cmd add --patch $argv[2..]
        case ps
            __dotfile_cmd push $argv[2..]
        case '*'
            __dotfile_cmd $argv
    end
end
