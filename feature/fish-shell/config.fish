if status is-interactive
    # Commands to run in interactive sessions can go here
end

source "$HOME/.bashrc.user"

bind -k ic accept-autosuggestion

bind \* 'commandline -i "\*"'

alias l='ls -hal'

alias m='mv -i'

alias r='rm -i'

alias c='cp -i'

alias grep='grep --color=auto'

# set -l last_status $status
# set stat (set_color red)"[$last_status]"(set_color normal)
# $CMD_DURATION (set_color brgreen)$USER(set_color white)@(set_color brblue)$hostname(set_color white):(set_color magenta)
#      (prompt_pwd) (set_color white)\$

# function fish_prompt
#     set -l last_status $status
#     string join '' -- (set_color brgreen)$USER(set_color white)@(set_color brblue)$hostname(set_color white):(set_color magenta) (prompt_pwd) (set_color white)\$
# end

function fish_prompt --description 'Informative prompt'
    if functions -q fish_is_root_user; and fish_is_root_user
        printf '%s@%s %s%s%s# ' $USER (prompt_hostname) (set -q fish_color_cwd_root
                                                         and set_color $fish_color_cwd_root
                                                         or set_color $fish_color_cwd) \
            (pwd) (set_color normal)
    else
        printf '%s@%s:%s$%s ' (set_color --bold green)$USER(set_color --bold magenta)\
        (set_color --bold blue)(prompt_hostname)(set_color --bold magenta) (set_color --bold yellow)(pwd)(set_color --bold green)\
        (set_color --bold magenta)\>(set_color normal)
    end
end

function fish_right_prompt
    # set -l last_pipestatus $pipestatus
    # set -lx __fish_last_status $status
    # set -l status_color (set_color $fish_color_status)
    # set -l statusb_color (set_color --bold $fish_color_status)
    # set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
    # printf '%s %s' (set_color normal)$pipestatus_string(set_color normal) (set_color normal)(set_color bryellow)(date "+%Y-%m-%d/%H:%M:%S")(set_color normal)
    printf '%s' (set_color yellow)(fish_vcs_prompt)(set_color normal)
end

function fish_greeting
    
end

function fish_title
    set -q argv[1]; or set argv fish
    echo $USER:(pwd);
end
