# Dotfiles
Keep track of all needed dotfiles

### Config alias
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

### Hide files that are not tracked
    config config --local status.showUntrackedFiles no

### Create repo on new machine
    git clone --bare <git-repo-url> $HOME/.cfg

### Create backup of existing dotfiles
    mkdir -p .config-backup && \
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} .config-backup/{}

### [Reference](https://www.atlassian.com/git/tutorials/dotfiles)

