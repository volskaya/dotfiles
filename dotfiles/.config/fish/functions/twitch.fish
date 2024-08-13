# Defined interactively
function twitch
    mpv --profile=twitch --quiet "https://www.twitch.tv/$argv[1]" $argv[2..-1]
end
