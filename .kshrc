# .kshrc - Created: 2004-08-27
# shellcheck shell=ksh

set -o posix
set -o vi vi-tabcomplete

# History
HISTFILE=$HOME/.history

PS1="\w \$ "
[ -n "${SSH_CLIENT:-}" ] && PS1="@\h: $PS1"
export PS1

howto() {
    : "${1:?Usage: howto <pattern>}"
    [ -r "$HOME/notes/howto" ] || { echo "Error: no howto file in $HOME/notes/howto" >&2; return 1; }
    awk -v p="$1" -v RS='' -v ORS='\n\n' \
        'tolower($0) ~ tolower(p)' "$HOME/notes/howto" 2>/dev/null || \
        echo "No match found for '$1'"
}

tarsnap() {
    : "${1:?Usage: tarsnap <target>}"
    [ ! -e "$1" ] && { echo "Error: '$1' does not exist" >&2; return 1; }
    pax -wz -f "$(basename "$1")_v$(date +%Y%m%d).pax.gz" "$1"
}

crypt() {
    : "${1:?Usage: crypt <file>}"
    openssl enc -aes-256-cbc -pbkdf2 -iter 100000 -md sha512 -salt -in "$1" -out "${1}.enc"
}

decrypt() {
    : "${1:?Usage: decrypt <file>}"
    openssl enc -aes-256-cbc -d -pbkdf2 -iter 100000 -md sha512 -in "$1" -out "${1%.enc}"
}

decrypt_deprecated() {
    : "${1:?Usage: decrypt_deprecated <file>}"
    openssl enc -aes-256-cbc -d -in "$1" -out "${1%.enc}"
}
