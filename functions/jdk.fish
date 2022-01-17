function jdk

    if test -z "$argv"
        __jdk_usage
        __jdk_available_arguments
        return
    end

    switch $argv[1]
        case -s --status
            __jdk_status
        case -l --list
            __jdk_list
        case -u --use
            __jdk_use $argv[2..]
        case -h --help
            __jdk_usage
            __jdk_available_arguments
        case '*'
            printf "Invalid arguments.\n"
            __jdk_available_arguments
    end
end

function __jdk_status
    java -version && javac -version
end

function __jdk_list
    set -l JVM_DIR $HOME/.local/lib/jvm
    if command -q exa
        exa --only-dirs --oneline --icons $JVM_DIR
        return
    end
    ls -1 $JVM_DIR
end

function __jdk_usage
    printf "Usage:\n"
    printf "    \e[1;32mjdk\e[0m \e[1;34m<argument>\e[0m\n"
    printf "    \e[1;32mjdk\e[0m \e[1;34m<argument>\e[0m \e[1;36m<jdk>\e[0m\n"
    printf "\n"
end

function __jdk_use
    if test (count $argv) -eq 0
        printf "Please specify a version\n"
        printf "Available version :\n"
        __jdk_list
        return
    end

    set -l DIR $HOME/.local/lib/jvm
    if test \( -e $DIR/$argv \) -a \( -d $DIR/$argv \)
        set DIR $DIR/$argv
        if test \( -e $DIR/bin \) -a \( -d $DIR/bin \)
            set -l JAVA_BIN_DIR $DIR/bin/java
            if test \( -e $JAVA_BIN_DIR \) -a \( ! -d $JAVA_BIN_DIR \)
                __jdk_link $argv
                return
            end
        end
    end

    printf "\e[1;31mInvalid\e[0m JDK directory.\n"
    printf "Available JDK :\n"
    __jdk_list
end


function __jdk_link --argument-names jdk_version
    set -l JVM_DIR $HOME/.local/lib/jvm
    if test -e $JVM_DIR/default
        rm -rf $JVM_DIR/default
    end
    ln -s $JVM_DIR/$jdk_version $JVM_DIR/default
    __jdk_status
end


function __jdk_available_arguments
    printf "Available arguments:\n"
    printf "    \e[94m-s\e[0m, \e[94m--status\e[0m\t: Display the used JDK Version\n"
    printf "    \e[94m-l\e[0m, \e[94m--list\e[0m\t\t: Displays a list of usable JDK\n"
    printf "    \e[94m-u\e[0m, \e[94m--use\e[0m\t\t: Specifies the JDK version to use\n"
    printf "\t\t\t  See \e[94m--list\e[0m for available version\n"
    printf "    \e[94m-h\e[0m, \e[94m--help\e[0m\t\t: Display this help\n"
end
