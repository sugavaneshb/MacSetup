# MacSetup
This repo contains my dotfiles and Mac setup configuration.

## Quick Start
Run `dotfiles/install.sh` to symlink all dotfiles to their expected locations.

## Dotfiles
Located in `dotfiles/`:
* `zshrc.dotfile` - Zsh config (oh-my-zsh, aliases, history, environment)
* `zprofile.dotfile` - Zsh profile (Homebrew shell env)
* `gitconfig.dotfile` - Git config (aliases, color, pager)
* `gitignore_global.dotfile` - Global gitignore
* `emacs.dotfile` - Emacs config (editorconfig, indentation, keybindings)
* `install.sh` - Symlinks all dotfiles to `~/`

## Homebrew
* Install Homebrew from [here](https://brew.sh/)
* Install all brew formulae: `brew bundle --file=Brewfile`
* To update the Brewfile: `brew bundle dump --force`

## Python
* Python is installed via Homebrew (`python@3.13` / `python@3.14`)
* Install packages: `pip3 install --break-system-packages -r pip3.txt`
* To update pip3.txt: `pip3 list --format=freeze > pip3.txt`

## iTerm
* Import preferences from **Dropbox/apps_setup/iterm2**
* Themes from [base16-iterm2](https://github.com/martinlindhe/base16-iterm2)
