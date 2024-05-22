## Basic setup

```sh
# Setup mirrors
termux-change-repo

# Install oh-my-termux (oh-my-zsh + fonts + color scheme)
# TODO: oh-my-termux is currently unmaintained, replace it
pkg install git curl file
curl -fsSL https://git.io/oh-my-termux | sed 's,git://,https://,' | bash

# Install oh-my-zsh only
pkg install git curl zsh file
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# For other packages, please refer to SETUP.md
```

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
