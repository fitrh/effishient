function promptcolor
    set --local COLOR_DIR $HOME/.config/fish/colors

    if test -z "$argv"
        printf "Please specify colorscheme to use.\n"
        printf "Available colorscheme\n"
        exa --icons --group-directories-first -1 $COLOR_DIR
        return
    end

    if test -e $COLOR_DIR/$argv[1].fish
        if test -f $COLOR_DIR/$argv[1].fish
            fish $COLOR_DIR/$argv[1].fish
        end
    end
end
