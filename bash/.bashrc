[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

colors=(black red green yellow blue magenta cyan white)
for i in $(seq 0 7); do
    eval "${colors[i]}=\"\[`tput sgr0; tput setaf $i`\]\""
    eval "`echo "${colors[i]}" | tr 'a-z' 'A-Z'`=\"\[`tput setaf $i; tput bold`\]\""
done;

function prompt_user()
{
    if [ $(id -u) != 0 ]; then
        echo -n "$yellow$(whoami)@"
    fi
}

function prompt_hostname()
{
    if [ `hostname` == 'limbo' ]; then
        hostname_color=$magenta
    else
        hostname_color=$green
    fi
    echo -n "${hostname_color}$(hostname)"
}

function prompt_path()
{
    echo -n "$white${PWD/#$HOME/~}"
}

function prompt_end()
{
    if [ "$1" == "0" ]; then
        echo -n $GREEN
    else
        echo -n $red
        if [ "$1" != "1" ]; then
            echo -n "!$1"
        fi
    fi
    echo -n ">$white "
}

function set_prompt()
{
    exit_code="$?"
    PS1="$(prompt_user)$(prompt_hostname) $(prompt_path)$(prompt_end $exit_code)"
}

PROMPT_COMMAND='set_prompt'

[ -r /etc/bash_completion ] && . /etc/bash_completion
