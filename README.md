# Dotfiles Darwin

Master your new setup!

Dotfiles are a collection of configuration files and scripts that help
you set up your development environment quickly and efficiently. This
repository contains my personal dotfiles for Darwin/MacOS system.

The main tool I use to manage my configuration files is stow. Stow allows me to
create symlinks from my dotfiles-darwin repository to the appropriate locations
in my home directory.

Coupled with a few setup scripts, I can easily set up a new machine or restore
my environment. I use Homebrew to install necessary packages and Zinit to set
up the ZSH shell which is my current shell of choice.

## Getting Started

Currently, the setup process is only tested on MacOS Tahoe arm64 system. To
setup a new machine with my dotfiles, follow these steps:

1. Clone the repository

    ```bash
    cd ~
    git clone --depth=1 https://github.com/prasetiyohadi/dotfiles-darwin.git
    ```

1. Install the packages

    ```bash
    cd dotfiles-darwin
    bash install.sh
    ```

1. Configure secrets

    ```bash
    cp env.sample .envrc
    nvim .envrc
    ```

1. Sync the configuration files, uncomment backup for Atuin config file if necessary

    ```bash
    bash sync.sh
    ```

## Tools and Frameworks

These are the tools and frameworks that I use for my daily tasks:

- [Homebrew](https://brew.sh/)
- [KeePassXC](https://keepassxc.org/download/#macos)
- [Zen Browser](https://zen-browser.app/download/)
- [Syncthing](https://syncthing.net/downloads/)
- [Telegram](https://macos.telegram.org/)
- [Ghostty](https://ghostty.org/docs/install/binary#macos)
- [LazyVim](https://www.lazyvim.org/installation)
- [WireGuard](https://www.wireguard.com/install/)
- [Tunnelblick](https://tunnelblick.net/downloads.html)

## Packages

These are the main packages I use in my setup:

- Arkade: A simple CLI for downloading Kubernetes tools and apps.
- Atuin: A modern shell history manager.
- Bat: A cat clone with syntax highlighting and Git integration.
- Direnv: An environment switcher for the shell.
- Eza: A modern replacement for 'ls' written in Rust.
- Fzf: A command-line fuzzy finder.
- Git: Version control system to manage my dotfiles repository.
- Mise: (pronounced "meez") or "mise-en-place" is a development environment
  setup tool.
- Nap: A tool to manage your notes and code snippets.
- Neovim: My preferred text editor.
- Pet: A command-line snippet manager.
- Ripgrep: A line-oriented search tool that recursively searches your current.
- Starship: A minimal, blazing-fast, and infinitely customizable prompt for any
  shell.
- Stow: A symlink manager that helps me manage my dotfiles.
- Tmux: Terminal multiplexer to manage multiple terminal sessions.
- ZSH: A powerful shell that I use as my default shell.
- Zinit: A Zsh plugin manager.
- Zoxide: A smarter cd command.

## Issues

Currently, there are known issues with the symlinks creation. For example, the
`config.toml` file in the Atuin config file is always automatically created by
Atuin, which may cause conflicts. To resolve this, you may need to backup the
existing config file first in the `sync.sh` file or manually symlink the file
after running the sync script.

- Fixing the Atuin config symlink issue:

    ```bash
    ln -frs ~/dotfiles/atuin/config.toml ~/.config/atuin/config.toml
    ```

## Contributing

You are welcome to contribute to this repository by submitting issues or pull
requests. Feel free to suggest improvements or report any bugs you encounter.
Thank you for your interest!
