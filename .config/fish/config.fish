set -x GDK_BACKEND wayland
set -x QT_QPA_PLATFORM wayland
set -x CLUTTER_BACKEND wayland
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x AWT_TOOLKIT MToolkit
set -x USE_GKE_GCLOUD_AUTH_PLUGIN True
set -x XDG_CURRENT_DESKTOP sway:dark
set -x GTK_THEME Adwaita:dark  # Replace with your preferred dark theme
set -x QT_STYLE_OVERRIDE Adwaita-dark  # Replace with your preferred dark theme
set -x WEBKIT_DISABLE_COMPOSITING_MODE 1
set -x MOZ_ENABLE_WAYLAND 1 firefox

alias k=kubectl

fish_add_path $HOME/google-cloud-sdk/bin
fish_add_path /opt/idea-IU-243.21565.193/bin/

if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
    exec sway > ~/.sway.log 2>&1
end

fish_ssh_agent

if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Check if autojump.fish exists and source it
if test -s $HOME/.autojump/share/autojump/autojump.fish
    source $HOME/.autojump/share/autojump/autojump.fish
end

bind \cf 'fish -c "$HOME/.tmux/tmux-sessionizer.sh"'
