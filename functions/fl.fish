function fl --wraps flutter

    if test (count $argv) -eq 0
        flutter --help
        return
    end

    switch $argv[1]
        case c crt create
            flutter create -v $argv[2..]
        case d doc doctor
            flutter doctor -v $argv[2..]
        case g get
            flutter packages get -v $argv[2..]
        case r run
            flutter run -v $argv[2..]
        case u up
            flutter packages upgrade -b $argv[-2..]
        case upgrade
            flutter upgrade -v $argv[2..]
        case ver version
            flutter --version $argv[2..]
        case '*'
            flutter $argv
    end
end
