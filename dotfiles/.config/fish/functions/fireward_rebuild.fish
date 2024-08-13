function fireward_rebuild
    set -l options
    set options $options (fish_opt -s d -l dry)
    argparse $options -- $argv

    if [ $_flag_dry ]
        fireward -i firestore.fireward -o firestore.rules
    else
        fireward -i firestore.fireward -o firestore.rules && firebase deploy --only firestore:rules
    end
end
