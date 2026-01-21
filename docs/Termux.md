## Basic setup

```sh
# Setup mirrors
termux-change-repo

# Install oh-my-zsh only
pkg install git curl zsh file
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Install color scheme and font
mkdir -p .termux
curl -fLo .termux/colors.properties 'https://raw.githubusercontent.com/adi1090x/termux-style/refs/heads/master/colors/base16-google-dark.properties'
curl -fLo .termux/colors.properties 'https://raw.githubusercontent.com/adi1090x/termux-style/refs/heads/master/colors/base16-monokai-dark.properties'
curl -fLo .termux/font.ttf 'https://raw.githubusercontent.com/adi1090x/termux-style/refs/heads/master/fonts/Fira.ttf'
curl -fLo .termux/font.ttf 'https://dtinth.github.io/comic-mono-font/ComicMono.ttf'
termux-reload-settings

# Setup storage
termux-setup-storage

# Install packages
pkg upgrade
pkg install root-repo vim mc
pkg install tsu
pkg install --no-install-recommends python nodejs
pkg install --no-install-recommends yt-dlp

# [DEPRECATED] Install oh-my-termux (oh-my-zsh + fonts + color scheme)
pkg install git curl file
curl -fsSL https://git.io/oh-my-termux | sed 's,git://,https://,' | bash
```

## Cleanup unnecessary explicit installs

In a default install there are way too many packages marked as manually installed. Clean them up by running:

```sh
# Backup
apt-mark showmanual > ~/apt-manual.txt

# Caution: this line may incorrectly operate on false positives on non-brand-new installs. Check before you run.
apt-mark showmanual | grep lib | xargs apt-mark auto

apt-mark auto apt bzip2 curl dpkg gzip tar unzip xxhash xz-utils zstd

apt-mark auto ca-certificates command-not-found dialog gpgv ncurses openssl patch pcre2 readline resolv-conf

apt-mark auto bash coreutils dash diffutils dos2unix ed findutils gawk grep less procps psmisc sed util-linux

apt-mark auto termux-am termux-am-socket termux-exec termux-keyring termux-licenses termux-tools

# Check if everything is correctly set
apt autoremove --purge
```

Only these packages are strictly needed to be set as manually installed: `debianutils nano termux-core wget`.

## CTF tools

```sh
apt install rust cmake unicorn radare2
(cd $PREFIX/tmp && ln -s ../include include)
CARGO_BUILD_TARGET=aarch64-linux-android pip install pwntools
```

## SSH access

```sh
pkg install openssh netcat-openbsd iproute2

# Turn off PasswordAuthentication
vim $PREFIX/etc/ssh/sshd_config

# Import SSH keys while avoiding to set passwords
ip addr wlan0
nc -lvNp 9876 > ssh.pub
cat ssh.pub
cat ssh.pub >> .ssh/authorized_keys
rm ssh.pub
```
