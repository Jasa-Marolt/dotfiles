function cd --wraps='z;ls' --description 'alias cd (zoxide) fallback to builtin cd; ls'
    # Try to change directory using z (zoxide)
    if not z $argv
        # If z fails, try using the built-in cd
        builtin cd $argv
    end

    # Check if the last command (z or builtin cd) succeeded
    if test $status -eq 0
        # If the directory change was successful, run the ls logic

        # Check the number of all items (including hidden)
        set countAll (ls -A | wc -l)

        if test $countAll -lt 15
            # If few items, show all, sorted by time
            ls -A -t
        else
            # If many items, check only visible ones
            set countVisible (ls | wc -l)
            if test $countVisible -lt 30
                # If few visible items, show them, sorted by time
                ls -t
            end
        end
    end
end

