set -g fish_color_autosuggestion 555 brblack
set -g fish_color_cancel -r
set -g fish_color_command green --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape bryellow --bold
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator white
set -g fish_color_param normal
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match bryellow '--background=white'
set -g fish_color_selection white --bold '--background=white'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

set -g fish_greeting

set -g VISUAL nvim
set -g EDITOR nvim
set -g PAGER nvimpager

function fish_user_key_bindings
    bind -M insert \ce accept-autosuggestion
end

starship init fish | source
