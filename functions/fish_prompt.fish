function fish_prompt --description 'Write out the prompt'
    set -l color_status $fish_color_status
    set -l status_code $pipestatus

    # Color the prompt differently when we're root
    set -l suffix (set_color white) '%'
    if contains -- $USER root toor
        set suffix (set_color red) '#'
    end

    if test $status_code -ne 0
        set suffix (set_color $color_status) "✗"
    end

    # Write pipestatus
    set -l status_color (set_color $color_status) (set_color --bold $color_status)
    set status_code (__fish_print_pipestatus "[" "]" "|" $status_color $status_code)

    set dir (string shorten -m 40 -l (prompt_pwd -d 1 -D 3))
    if test "$dir" != "~" # Show working dir if not `$HOME`
        printf "%s%s%s\n" (set_color blue --bold) $dir (set_color normal)
    end
    echo -n -s -e $status_code $suffix " "
end
