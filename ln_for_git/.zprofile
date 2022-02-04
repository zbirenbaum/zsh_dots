#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>

#
# Paths
#
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#made this into a systemd script.
# if [ "$(ps aux | grep -e ping | wc -l)" -le "1" ]; then
#   ~/.config/zsh/keepalive.sh
# fi

if [ -n "$SSH_CONNECTION" ]; then
  remote=$(echo $SSH_CONNECTION | awk '{ print $1 }')
  export DISPLAY="$remote:0.0"
fi

# Reduce vimode lag
#PERL INIT
PATH="/home/zach/.local/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/zach/.local/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/zach/.local/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/zach/.local/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/zach/.local/perl5"; export PERL_MM_OPT;

# RUBY INIT
export PATH=/home/zach/.local/share/gem/ruby/3.0.0/bin:$PATH
#export PATH=$HOME/.config/rofi/bin:$PATH

# CUDA DEFAULTS
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export PATH=$PATH:/usr/local/cuda/bin
export CUDA_HOME=$CUDA_HOME:/usr/local/cuda

# EDITOR DEFAULTS
export EDITOR=nvim
export VISUAL=nvim

# PYENV INIT
export PYENV_ROOT=~/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=/usr/local/bin:$PATH
#NVM INIT
source $HOME/.nvm/nvm.sh  # This loads NVM

#G0 INIT
export GOPATH=$HOME/.local/go
export GOMODCACHE=$GOPATH/pkg/mod
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
#export PATH=/usr/local/go/bin:$PATH
#export PATH=$PATH:$(go env GOPATH)/bin

export PATH=/home/zach/.local/bin:$PATH
export VIRTUALENVWRAPPER_PYTHON=/home/zach/.pyenv/shims/python
export WORKON_HOME=/home/zach/.virtualenvs
eval "$(pyenv init --path)"
#
# Less
#
#display dotfiles in fzftab
setopt globdots
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
export LESS='-g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
