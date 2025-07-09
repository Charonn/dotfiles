set -x GDK_BACKEND wayland
set -x QT_QPA_PLATFORM wayland
set -x CLUTTER_BACKEND wayland
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x AWT_TOOLKIT MToolkit
set -x USE_GKE_GCLOUD_AUTH_PLUGIN True
set -x XDG_CURRENT_DESKTOP sway:dark
set -x GTK_THEME Adwaita:dark # Replace with your preferred dark theme
set -x QT_STYLE_OVERRIDE Adwaita-dark # Replace with your preferred dark theme
set -x WEBKIT_DISABLE_COMPOSITING_MODE 1
set -x MOZ_ENABLE_WAYLAND 1 firefox
set -x GOPRIVATE gitlab.setlog.lan
# Set GTK dark theme
set -Ux GTK_THEME Adwaita-dark
set -x VAULT_ADDR https://vault.setlog.lan
# Set Qt dark mode
set -Ux QT_QPA_PLATFORMTHEME qt5ct

alias k=kubectl

fish_add_path $HOME/google-cloud-sdk/bin
fish_add_path /opt/idea-IU-243.21565.193/bin/
fish_add_path /usr/local/go/bin
fish_add_path $HOME/go/bin
fish_add_path $GOPATH/bin
fish_add_path /opt/nvim-linux-x86_64/bin
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end


if test -z "$DISPLAY" -a (tty) = /dev/tty1
    exec sway >~/.sway.log 2>&1
end

op completion fish | source
fish_ssh_agent

if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Check if autojump.fish exists and source it
if test -s $HOME/.autojump/share/autojump/autojump.fish
    source $HOME/.autojump/share/autojump/autojump.fish
end

function loadenv -a file
    while read -l line
        eval "export $line"
    end <$file >/dev/null
end

bind \cf 'fish -c "$HOME/.tmux/tmux-sessionizer.sh"'
