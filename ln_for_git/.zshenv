#
# Defines environment variables.
#

#ALIAS
alias vimdiff='nvim -d'
alias nvim="/home/zach/progfiles/neovim-git/bin/nvim"
alias vim="nvim"
alias vi="nvim"
alias ls="exa --icons"
alias l="exa --icons"
alias wrecog="cd ~/development/research/summer/SealFaceRecognition/"
alias wp10="cd ~/.config/zsh/.zprezto/modules/prompt/external/powerlevel10k/internal/"
alias p10test="rm -rf ~/.cache/*p10k* && zcompile ~/.config/zsh/.zprezto/modules/prompt/external/powerlevel10k/internal/p10k.zsh"
alias mutt="neomutt"
alias nvconf="cd ~/.config/nvim/lua/custom"

source '/home/zach/.config/zsh/fzftab.zsh'

# if [ -n "$SSH_TTY" ]; then
#    zstyle ':prezto:module:tmux:session' name 'ssh'
# else
#    zstyle ':prezto:module:tmux:session' name 'local'
# fi

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
