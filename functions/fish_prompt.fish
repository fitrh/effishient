function fish_prompt --description 'Write out the prompt'
    set -l last_status $pipestatus
    set -l color_status $fish_color_status

    # Color the prompt differently when we're root
    set -l suffix (set_color white) '%'
    if fish_is_root_user
        set suffix (set_color red) '#'
    end

    # Write pipestatus
    set -l status_color (set_color $color_status) (set_color --bold $color_status)
    set -l code (__fish_print_pipestatus "[" "]" "|" $status_color $last_status)
    if test -n "$code"
        set suffix (set_color $color_status) "✗"
    end

    set dir (string shorten -m 40 -l (prompt_pwd -d 1 -D 3))
    if test "$dir" != "~" # Show working dir if not `$HOME`
        printf "%s%s%s\n" (set_color blue --bold) $dir (set_color normal)
    end
    echo -n -s -e $code $suffix " "
end
