# fugrep
fuzzy freifunk search

![Screencast](use.gif)

Requires jq and fzf

#Usage:

```bash
$./fugrep.sh
```

#Requires:

- A shell: bash, zsh or fish
- fzf: https://github.com/junegunn/fzf
- jq: json parser

#Install:

##Arch Linux

```bash
pacman -S fzf jq
```

##Debian Linux

```bash
apt-get isntall jq
git clone https://github.com/junegunn/fzf.git
cd fzf
./install
```
