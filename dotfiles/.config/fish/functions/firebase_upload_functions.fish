# Defined in /tmp/fish.xSNU10/firebase_upload_functions.fish @ line 2
function firebase_upload_functions
    if [ $argv[1] ]
        set line "functions:$argv[1]"
    else
        set line ""
    end

    for val in $argv[2..-1]
        set line "$line,functions:$val"
    end

    firebase deploy --only $line
end
