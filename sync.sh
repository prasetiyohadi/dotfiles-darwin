#!/usr/bin/env bash
set -euo pipefail

# Prepare config directories
echo '### Preparing config directories...' | gum format
mkdir -p ~/.{config,nap,ssh}
mkdir -p ~/.config/{atuin,ghostty,mise,pet}

# Generate config files from template
echo '### Generating config files from template...' | gum format
envsubst <.config/pet/config.toml.tpl >.config/pet/config.toml
envsubst '$GIT_EMAIL,$GIT_NAME' <.gitconfig.tpl >.gitconfig

# Secure config files containing secrets
echo '### Securing config files containing secrets...' | gum format
chmod og-rwx .config/pet/config.toml

# Create backup for existing config files
echo '### Creating backup for the existing config files...' | gum format
CURRENT_DATE=$(date +%Y%m%d-%H%M%S)
# mv -v ~/.config/atuin/config.toml{,".bak-$CURRENT_DATE"} # atuin auto-generated its config upon install so we need to backup it first, uncomment this line on initial sync
# mv -v ~/.config/mise/config.toml{,".bak-$CURRENT_DATE"}
# mv -v ~/.config/ghostty/config{,".bak-$CURRENT_DATE"}
# mv -v ~/.config/pet/config.toml{,".bak-$CURRENT_DATE"}
# mv -v ~/.config/starship.toml{,".bak-$CURRENT_DATE"}
# mv -v ~/.nap/config.yaml{,".bak-$CURRENT_DATE"}
# mv -v ~/.gitconfig{,".bak-$CURRENT_DATE"}
# mv -v ~/.tmux.conf{,".bak-$CURRENT_DATE"}
# mv -v ~/.zprofile{,".bak-$CURRENT_DATE"}
# mv -v ~/.zshrc{,".bak-$CURRENT_DATE"}

# Create symlinks for the config files
echo '### Creating symlinks for the config files...' | gum format
stow .

echo '### TODO: Execute `source ~/.zshrc`' | gum format
