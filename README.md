# Dotfiles

After cloning this repo, run `install` to automatically set up the development environment. Note that the install script is idempotent: it can safely be run multiple times.

## Homebrew

- Installed packages by running `brew bundle`

## Neovim

- After opening vim, run `:Lazy` to install all plugins

### Updates

- Packages `:Lazy` & then `S` to sync
- TreeSitter `:TSUpdate`
- Mason `:Mason` and then `U`

## GPG Setup (optional)

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

## Encryption

```sh
# Encrypt
openssl enc -aes-256-cbc -salt -pbkdf2 -in input.file -out output.enc

# Decrypt
openssl enc -aes-256-cbc -d -pbkdf2 -in output.enc -out input.file
```

