# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

HISTTIMEFORMAT="%Y/%m/%d(%a) %T "
HISTSIZE=10000
HISTFILESIZE=10000

# https://qiita.com/piroor/items/7c9380e408d07fd83bfc
function share_history {
  # overwrite the newest command you ran
  history -a
  # clear the command history saved in memory
  history -c
  # load history from file into the memory
  history -r
}

PROMPT_COMMAND+='share_history;'
# disable overwriting the command history on the memory into a file
# because `shopt -u histappend`
shopt -u histappend


