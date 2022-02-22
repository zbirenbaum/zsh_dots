export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
FZF_TAB_HEIGHTVAR=$(($LINES/2))


# function reload_trap(){
# Moved to main plugin complete as hook
#    trap "set_default_opts" WINCH 
# }

function main(){
   zstyle ':fzf-tab:*' fzf-pad $FZF_TAB_HEIGHTVAR
   zstyle ':fzf-tab:*' fzf-flags --color bg+:'#10171f'
   zstyle ':fzf-tab:*' continuous-trigger '/'
   zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
   zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
   zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
     'ps --pid="$word" -o cmd --no-headers -w -w'
   zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

   zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
   zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
   zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
   export LESSOPEN='|~/.config/zsh/.lessfilter %s'
}

main
# reload_trap
