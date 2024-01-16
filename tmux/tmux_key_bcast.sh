# Send a command to all tmux windows
command="$@"
tmux list-panes -a -F '#{session_name}:#{window_index}.#{pane_index}' | xargs -I PANE tmux send-keys -t PANE "$command" Enter
