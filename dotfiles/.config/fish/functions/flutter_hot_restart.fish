function flutter_hot_restart
    set -l root (git rev-parse --show-toplevel 2>/dev/null)
    set -l pid_file_path $root/flutter.pid

    if test -f $pid_file_path
        kill -USR2 (cat $pid_file_path)
    else
        echo "Can't hot restart, flutter.pid file not found."
    end
end
