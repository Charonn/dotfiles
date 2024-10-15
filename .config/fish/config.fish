if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Check if autojump.fish exists and source it
if test -s $HOME/.autojump/share/autojump/autojump.fish
    source $HOME/.autojump/share/autojump/autojump.fish
end

bind \cf 'fish -c "$HOME/.tmux/tmux-sessionizer.sh"'
