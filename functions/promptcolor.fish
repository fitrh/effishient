function promptcolor
    set --local COLOR_DIR $HOME/.config/fish/colors

    if test -z "$argv"
        printf "Please specify colorscheme to use.\n"
        printf "Available colorscheme\n"

        if command -q eza
            eza --icons --group-directories-first -1 $COLOR_DIR
            return
        end

        if command -q exa
            exa --icons --group-directories-first -1 $COLOR_DIR
            return
        end

        ls --color --group-directories-first -hp -1 $COLOR_DIR
    end

    if test -e $COLOR_DIR/$argv[1].fish
        if test -f $COLOR_DIR/$argv[1].fish
            fish $COLOR_DIR/$argv[1].fish
        end
    end
end
