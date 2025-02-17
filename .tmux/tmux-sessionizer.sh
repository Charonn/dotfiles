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

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
else
    tmux attach-session -t $selected_name
fi

tmux switch-client -t $selected_name
