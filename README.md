## Machine Setup

Run
```sh
chmod +x setup.sh
./setup.sh
```

## IDE Setup
- iTerm
- Neovim
- Zsh
- Tmux

![Screen Shot 2021-06-02 at 10 12 58 pm](https://user-images.githubusercontent.com/2555067/120477967-b23eeb00-c3ef-11eb-806c-6f091b9ff5a0.png)

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
