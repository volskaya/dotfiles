# Defined in /tmp/fish.cqHYdA/watch_and.fish @ line 2
function watch_and --description 'Watches a file at --path and calls function when the file changes'
    set -l options

    set options $options (fish_opt -s h -l help)
    set options $options (fish_opt -s p -l path --required-val)

    argparse $options -- $argv

    if [ $_flag_help ]
        echo "Usage: watch_and -p ./file echo \"Changed\""
        echo ""
        echo "Options:"
        echo "       -p or --path  File path to watch for changes"
        return
    end

    echo "Watching $_flag_path"

    fswatch -o $_flag_path | while read ignored_line
        $argv[1..]
    end
end
