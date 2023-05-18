function fish_prompt --description 'Write out the prompt'
    set -l last_status $pipestatus
    set -l color_status $fish_color_status

    set -l suffix (set_color white) '%'
    if fish_is_root_user
        set suffix (set_color red) '#' # Change the prompt suffix and color when we're root
    end

    set -l status_color (set_color $color_status) (set_color --bold $color_status)
    set -l code (__fish_print_pipestatus '[' ']' '|' $status_color $last_status) # Contains exit code if it is an error
    if test -n "$code"
        set suffix (set_color $color_status) '✗' # Change the prompt suffix on exit error
    end

    set dir (string shorten -m 50 -l (prompt_pwd -d 1 -D 3))
    if test "$dir" != '~' # Show working dir if not `$HOME`
        set dir (string split '/' $dir)
        printf '%s%s/' (set_color white) (string join '/' $dir[1..-2])
        printf '%s%s%s\n' (set_color blue --bold) $dir[-1] (set_color normal)
    end
    echo -n -s -e $code $suffix ' '
end
