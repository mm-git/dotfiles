# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors
export CLICOLOR=1
export TERM=xterm-256color

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ':vcs_info:git:*' formats '(%b)' '%c%u'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)' '%c%u'
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"
precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
    psvar[2]=$vcs_info_msg_1_
}
PROMPT="%F{green}[%n@%m] %~%F
%F{yellow}%1v%f%F{red}%2v%f%(!,#,$) "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする

#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit
compinit -u

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# = の後はパス名として補完する
setopt magic_equal_subst

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

########################################
# peco-history

peco-history() {
  BUFFER=$(history -n 1 | tail -r | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-history
bindkey '^R' peco-history

########################################
# エイリアス

alias ll='ls -la'
alias mkdir='mkdir -p'

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

alias fs='fs.sh'
alias ff='ff.sh'
alias rs='rs.sh'
alias rf='git flow release finish'
alias rf2='rf2.sh'
alias pi='ssh pi'
alias issuestart='issuestart.sh'
alias ap='cd ~/Develop/AndroidProjects'
alias xp='cd ~/Develop/xcodeProjects'
alias pp='cd ~/Develop/PhpStormProjects'

# Path関連設定
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Applications/AndroidADT/sdk/platform-tools

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

#JAVA
export JAVA_HOME=`/usr/libexec/java_home`

# brew cask application folder
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# node.js
export PATH=$PATH:/usr/local/bin/npm
export NODE_PATH=/usr/local/lib/node_modules

source ~/.zshrc.antigen

