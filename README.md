# Dotfiles

After cloning this repo, run `install` to automatically set up the development environment. Note that the install script is idempotent: it can safely be run multiple times.

![SCR-20230527-wgv](https://github.com/arjunkomath/dotfiles/assets/2555067/442c0c1e-939f-44d0-8da7-2e40dea94df9)

## Homebrew

- Installed packages by running `brew bundle`

## Neovim

- After opening vim, run `:Lazy` to install all plugins
- Config inspired by [craftzdog](https://github.com/craftzdog/dotfiles-public) & [ThePrimeagen](https://github.com/ThePrimeagen/init.lua)

## Tmux
- Install plugin manager https://github.com/tmux-plugins/tpm

### Updates

- Packages `:Lazy` & then `S` to sync
- TreeSitter `:TSUpdate`
- Mason `:Mason` and then `U`

## GPG Setup

1. Install https://gpgtools.org
2. Import / Create new key
3. Get key ID from your list of keys `gpg --list-keys`
4. Enable signing

```sh
git config --global commit.gpgsign true
git config --global user.signingkey ABCDEF01 # Use key ID copied earlier
```

5. Commit and verify using `git log --show-signature`

## LSPs

Install using Mason
