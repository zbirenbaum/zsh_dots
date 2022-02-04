# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [ -z "$TMUX" ]; then
#  exec tmux new-session -A -s workspace
#fi

# Auto start a session when Zsh is launched in a local terminal.
#zstyle ':prezto:module:tmux:auto-start' local 'yes'

#zstyle ':prezto:module:tmux:auto-start' mode 'shared'
#
# function exit {
#   if [ ${TMUX} ] && [ $(tmux list-panes | wc -l) -eq 1 ] && [ -z $NVIM_LISTEN_ADDRESS ]; then
#     tmux detach
#   else 
#       builtin exit
#   fi
# }
source "/home/zach/.config/zsh/.zcustomcolors.zsh"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source "/home/zach/.config/zsh/.zvmfunc.zsh"
source "/home/zach/.config/zsh/vi_mode_cursorswitch.zsh"
#bindkey 'kj' vi-cmd-mode

#bindkey 'jk' vi-cmd-mode
#bindkey 'kj' vi-cmd-mode
# Customize to your needs...
#setopt prompt_subst
#PROMPT='$FG[237]${(l:$COLUMNS::=:):-}%{$reset_color%}'
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# if tmux is executable, X is running, and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
# LOAD PYENV MUST BE AT BOTTOM
eval "$(pyenv init -)"
eval "$(/home/zach/.local/bin/pyenv-sh-virtualenvwrapper_lazy)"
eval "$(pyenv init --path)"
autoload -U compinit && compinit

