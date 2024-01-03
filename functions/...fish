function .. --description 'Go to the n-th parent dir' --argument-names depth
    set parent '..'
    if test -n "$depth"
        set parent (string repeat --count $depth '../')
    end

    if test $status -ne 0
        return 1
    end

    cd $parent
end
