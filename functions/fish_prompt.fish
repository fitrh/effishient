# Defined in /usr/share/fish/functions/fish_prompt.fish @ line 4
function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -l normal (set_color normal)

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l prefix
    set -l suffix ''
    if contains -- $USER root toor
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # If we're running via SSH, change the host color.
    set -l color_host $fish_color_host
    if set -q SSH_TTY
        set color_host $fish_color_host_remote
    end

    # Write pipestatus
    set -l prompt_status \
        (__fish_print_pipestatus " [" "]" "|" \
    (set_color $fish_color_status) \
    (set_color --bold $fish_color_status) $last_pipestatus)

    # Set preifx icon if we're in a git repo
    set -l vcs_prefix
    if test (fish_git_prompt)
        set vcs_prefix ""
        set -g __fish_git_prompt_show_informative_status 1 # enable git status information
        set -g __fish_git_prompt_color_prefix --bold
        set -g __fish_git_prompt_color_suffix --bold
        set -g __fish_git_prompt_color_branch --bold
        set -g __fish_git_prompt_char_stateseparator (set_color black) "·$normal"
        set -g __fish_git_prompt_char_cleanstate ''
        set -g __fish_git_prompt_color_dirtystate white
        set -g __fish_git_prompt_char_dirtystate " *"
        set -g __fish_git_prompt_color_invalidstate brred
        set -g __fish_git_prompt_char_invalidstate " #"
        set -g __fish_git_prompt_color_stagedstate green
        set -g __fish_git_prompt_char_stagedstate " +"
        set -g __fish_git_prompt_color_stashstate yellow
        set -g __fish_git_prompt_char_stashstate " \$"
        set -g __fish_git_prompt_color_untrackedfiles brblack
        set -g __fish_git_prompt_char_untrackedfiles " …"
        set -g __fish_git_prompt_color_upstream_ahead brblue
        set -g __fish_git_prompt_char_upstream_ahead " ↑"
        set -g __fish_git_prompt_color_upstream_behind brwhite
        set -g __fish_git_prompt_char_upstream_behind " ↓"
        set -g __fish_git_prompt_color_upstream_diverged magenta
        set -g __fish_git_prompt_char_upstream_diverged " <>"
        set -g __fish_git_prompt_char_upstream_equal " ="
    end

    echo -n -s -e \
        (set_color $fish_color_user) "$USER" $normal @ \
        (set_color $color_host) (prompt_hostname) $normal " in " \
        (set_color $color_cwd) "" $normal " " \
        (set_color --bold) (basename (prompt_pwd)) $normal " " \
        (set_color --bold brmagenta) $vcs_prefix $normal \
        (set_color --bold) (fish_vcs_prompt) $normal \
        $prompt_status "\n" $suffix " "
end
