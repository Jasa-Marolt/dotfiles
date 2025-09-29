function cd --wraps='z;ls' --description 'alias cd z;ls'
    # Change directory using z
    z $argv

    # Check the number of non-directory items in the current folder (excluding . and ..)
    set countAll (ls -A| wc -l)

    # If the count is less than 10, run ls -A
    if test $countAll -lt 15
        ls -A -t
    else

        set countVisible (ls | wc -l)
        if test $countVisible -lt 30
            ls -t
        end

    end
end
