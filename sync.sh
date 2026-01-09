#!/usr/bin/env bash
set -euo pipefail

# Prepare config directories
mkdir -p ~/.{config,nap,ssh}
mkdir -p ~/.config/{atuin,ghostty,mise,pet}

# Generate config file from template
envsubst <.config/pet/config.toml.tpl >.config/pet/config.toml
envsubst '$GIT_EMAIL,$GIT_NAME' <.gitconfig.tpl >.gitconfig

chmod og-rwx .config/pet/config.toml

# CURRENT_DATE=$(date +%Y%m%d-%H%M%S)
# mv -v ~/.config/atuin/config.toml{,".bak-$CURRENT_DATE"}
# mv -v ~/.config/mise/config.toml{,".bak-$CURRENT_DATE"}
# mv -v ~/.config/ghostty/config{,".bak-$CURRENT_DATE"}
# mv -v ~/.config/pet/config.toml{,".bak-$CURRENT_DATE"}
# mv -v ~/.gitconfig{,".bak-$CURRENT_DATE"}
# mv -v ~/.tmux.conf{,".bak-$CURRENT_DATE"}
# mv -v ~/.zshrc{,".bak-$CURRENT_DATE"}

# Create symlinks for the config files
stow .

echo '### Execute `source ~/.zshrc`.' | gum format
