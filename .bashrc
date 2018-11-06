# .bashrc

# make sure global definitions are captured
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# simple bash prompt
# [dsesami] src ➜ 
export ARROW=$'\u279c'
export PS1="[\u] \W ${ARROW} "

# make sure rm doesn't delete blindly, have to use -f to explicitly force
alias rm="rm -i"

# update your bashrc quicker
alias ub="source ~/.bashrc"

alias mkdir="mkdir --verbose"

# Have ranger exit in your current directory
# depends on ranger: https://github.com/ranger/ranger
alias ranger='ranger --chosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# easy file search that matches any part of the file path.
# case sensitive due for performance reasons.
# depends on ripgrep: https://github.com/BurntSushi/ripgrep
se() {
    rg --files -g "*$1*"
}

# sometimes docker is a mess and everything in the universe needs to be destroyed
# use at your own risk
dockernuke() {
    docker rm -f $(docker ps -aq) 2>/dev/null
    docker rmi -f $(docker images -aq) 2>/dev/null
    docker system prune
}

# easier python virtual environments
# create your virtual environments and put them into ~/.envs
# start by making a virtual env:
#     python3 -m venv ~/.envs/foo
#     activate foo # enter the virtual env
#     deactivate   # exit the virtual env
activate() {
    source ~/.envs/$1/bin/activate
}
