# .profile (2004-08-27)

LC_ALL="fr_FR.UTF-8"; export LC_ALL

case $PATH in *"$HOME/.local/bin"*) ;; *) PATH="$HOME/.local/bin:$PATH" ; export PATH ;; esac

GOPATH="$HOME/.local/share/go"; export GOPATH

ENV="$HOME/.kshrc"; export ENV
