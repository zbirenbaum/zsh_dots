# check_terminal_size () {
#     if [[ "$LINES $COLUMNS" != "$previous_lines $previous_columns" ]]; then
#         set_default_opts
#     fi
#     previous_lines=$LINES
#     previous_columns=$COLUMNS
# }

  #--color=fg:#707a8c,bg:-1,hl:#3e9831,fg+:#cbccc6,bg+:#0e1419,hl+:#5fff87 \
  #--color=fg:#707a8c,bg:-1,hl:#3e9831,fg+:#cbccc6,bg+:#434c5e,hl+:#5fff87 \
function set_default_opts(){
  #TMUX_ID_STRING=$(tmux display-message -p '#S:#W.#P')
  WIDTHVAR=$(($COLUMNS/2))
  HEIGHTVAR=$(($LINES/2))
  zstyle ':fzf-tab:*' fzf-pad $HEIGHTVAR
  #WIDTHVAR=$(($COLUMNS/2))
  export FZF_DEFAULT_OPTS="
  --color=fg:#707a8c,bg:-1,hl:#3e9831,fg+:#cbccc6,bg+:#0e1419,hl+:#5fff87 \
  --color=dark \
  --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7 \
  --sort \
  --layout=reverse \
  --preview-window=right:$WIDTHVAR
  --bind '?:toggle-preview' \
  --cycle \
  "
  #source "fzftmux-autoselective-resize.zsh"
 
  #kill -INT 888 $(pgrep fzf) &
  return
}

zstyle ':fzf-tab:*' fzf-flags --color bg+:'#0e1419'
#check_terminal_size
set_default_opts
trap "set_default_opts" WINCH 

zstyle ':fzf-tab:*' continuous-trigger '/'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
  #'ps --pid="$word" -o cmd --no-headers -w -w'
  #'[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'

zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  'ps --pid="$word" -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
# zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
#show systemd unit status
#
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
#environment vars
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
#call to file where filepreviews are defined
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.config/zsh/.lessfilter %s'


#git
# zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
# 	'git diff $word | delta'|
# zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
# 	'git log --color=always $word'
# zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
# 	'git help $word | bat -plman --color=always'
# zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
# 	'case "$group" in
# 	"commit tag") git show --color=always $word ;;
# 	*) git show --color=always $word | delta ;;
# 	esac'
# zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
# 	'case "$group" in
# 	"modified file") git diff $word | delta ;;
# 	"recent commit object name") git show --color=always $word | delta ;;
# 	*) git log --color=always $word ;;
# 	esac'
# give a preview of commandline arguments when completing `kill`
# 

#FZF_HIDDEN_PREVIEW="fzf-tmux -p 90%,80% --preview-window down:3:hidden:wrap --height 60% --reverse --bind '?:toggle-preview'"
#zstyle ':fzf-tab:*' popup-pad 100 20
#FZF_HIDDEN_PREVIEW="fzf-tmux -p 20%,20% --preview-window down:3:hidden:wrap --reverse --bind '?:toggle-preview'"
#zstyle ':fzf-tab:*' fzf-pad 12
#--height=100%
#zstyle ':fzf-tab:*' fzf-command fzf
#zstyle ':fzf-tab:*' fzf --preview
#export FZF_TAB_OPTS=(--min-height=)
#
#zstyle ':fzf-tab:*' fzf-command fzf
#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
#zstyle ':fzf-tab:*' popup-pad 45 45
#-r 80% \

#zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
#zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
#  '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
#zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'

#zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
