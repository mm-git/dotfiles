alias ll='ls -la'
alias fs='fs.sh'
alias ff='ff.sh'
alias rs='rs.sh'
alias rf='git flow release finish'
alias rf2='rf2.sh'
alias ap='cd ~/Develop/AndroidProjects'
alias xp='cd ~/Develop/xcodeProjects'
alias pp='cd ~/Develop/PhpStormProjects'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# php
export PATH=/Applications/MAMP/bin/php/php5.5.3/bin:$PATH

#JAVA
export JAVA_HOME=`/usr/libexec/java_home`

#重複履歴を無視
export HISTCONTROL=ignoredups
export HISTIGNORE="fg*:bg*:history*:cd*"
export HISTSIZE=20000

#brew cask Application folder
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
