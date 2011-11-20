[ -z "$PS1" ] && return

BASH_CONF_DIR="$( dirname "$( readlink -f "${BASH_SOURCE[0]}" )" )"
DOTFILES_DIR="$(cd "${BASH_CONF_DIR}/.." && pwd)"

source "${BASH_CONF_DIR}/lib/colors"
source "${BASH_CONF_DIR}/lib/git"
source "${BASH_CONF_DIR}/aliases"
source "${BASH_CONF_DIR}/prompt"

export INPUTRC="~/.inputrc"

[ -r /etc/bash_completion ] && . /etc/bash_completion
