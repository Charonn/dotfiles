#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find ~/ ~/.config/ ~/workspace/ -mindepth 1 -maxdepth 4 \
    \( -path "$HOME/workspace/jdtls-workspace*" -o -path "$HOME/jdtls-workspace*" \) -prune \
    -o -type d -readable -print | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

clear # Clears the terminal after selection

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s "$selected_name" -c "$selected" -n "ide" -d
  tmux send-keys -t "$selected_name:1" "nvim" C-m # Start nvim in window 1
  tmux new-window -t "$selected_name" -n "shell" -c "$selected"
  tmux select-window -t "$selected_name:2" # Stay on window 2 (terminal)
  tmux attach-session -t "$selected_name"
  exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected" -n "ide"
  tmux send-keys -t "$selected_name:1" "nvim" C-m # Start nvim in window 1
  tmux new-window -t "$selected_name" -n "shell" -c "$selected"
fi

tmux select-window -t "$selected_name:2" # Stay on window 2 (terminal)
tmux switch-client -t "$selected_name"
