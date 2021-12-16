kill -INT 888 $(pgrep fzf)
TMUX_ID_STRING=$(tmux display-message -p '#S:#W.#P')
tmux send-keys -t $TMUX_ID_STRING "C-c"
tmux send-keys -t $TMUX_ID_STRING "C-I"

