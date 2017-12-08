# MacSetup
This repo will contain all my dotfiles and my mac related setup.

## Setup
Backup all system preferences to **Dropbox/apps_setup/** directory.

### Homebrew
* Install homebrew form [here](https://brew.sh/)
* Install all brew formulae from `Brewfile` in this repo.
* Periodically run `brew bundle dump (--force)` to update the Brewfile

### iTerm
* Import preferences from **Dropbox/apps_setup/iterm2**
* Use the themes maintained in [this git repo](https://github.com/martinlindhe/base16-iterm2)
* Currently I use `base16-atelier-dune-256`.

### Python setup
* Install python from **Homebrew**. Update `PATH` in your `rc/profile` dotfile.
* Homebrew python comes with `pip2`. Use it install `jupyter`, `numpy`
* Install packages with `pip2` from `pip2.txt` file in this directory


#### To Do
* Add all dotfiles
* Document applications setup
