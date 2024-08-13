function flutter_hot_reload
    set -l pid_file_path ./flutter.pid

    if test -f $pid_file_path
        kill -USR1 (cat $pid_file_path)
    else
        echo "Can't hot reload, flutter.pid file not found."
    end
end
