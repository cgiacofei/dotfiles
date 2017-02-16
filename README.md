# Home Folder Dotfiles

Settings for:

* SSH

* Git

* vim

* zsh (plus aliases)

* bash

Also contains:

* todo.txt configuration

* setup scripts for new installations

## Setup ghi for GitHub
Go to https://github.com/settings/tokens and generate a personal access token, give it repo perms, then run `git config --global ghi.token <that token>`.

ghi is found at https://github.com/stephencelis/ghi.

## Environment Variables Needed in ~/.profile
GitHub Access Token: `GH\_TOKEN`
Name for git user: `GH\_NAME`
E-mail for git user: `GH\_EMAIL`
Location of syncthing shared folder: `SYNC\_DIR`


