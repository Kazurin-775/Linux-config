# Basic setup

## Packages (for Debian-based OSes)

```sh
# Basic packages
sudo apt install build-essential git zsh wget curl tmux vim p7zip-full htop aria2

# CLI utilities
sudo apt install netcat socat strace ltrace

# Desktop environment
sudo apt install ibus-rime keepassxc
# Note: GNOME uses IBus by default

# CTF tools
sudo apt install python-pwntools pwndbg radare2
```

## zsh

```sh
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Nerd Fonts
wget 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip'
mkdir -p ~/.local/share/fonts
(cd ~/.local/share/fonts && unzip ~/JetBrainsMono.zip)
rm JetBrainsMono.zip

# Powerlevel 10k
git clone --depth=1 'https://github.com/romkatv/powerlevel10k.git' "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# zsh-autosuggestions
git clone --depth=1 'https://github.com/zsh-users/zsh-autosuggestions.git' "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
```

## Rust

```sh
# Arch Linux
sudo pacman -S rustup

# Manually install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Configure alternative Cargo registry
cat > ~/.cargo/config <<EOF
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = 'git://mirrors.ustc.edu.cn/crates.io-index'

[registries.ustc]
index = 'git://mirrors.ustc.edu.cn/crates.io-index'

[net]
git-fetch-with-cli = true
EOF

# Install helper tools
cargo install cargo-edit
```

## Neovim

```sh
# Arch Linux
sudo pacman -S neovim

# Manually install latest version (v0.6.1)
wget 'https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz'
(cd /opt && sudo tar xf ~/nvim-linux64.tar.gz)
sudo ln -s '/opt/nvim-linux64/bin/nvim' '/usr/local/bin/nvim'
rm nvim-linux64.tar.gz

# Apply configurations from Vim
mkdir -p ~/.config/nvim
ln -s ~/.vim/autoload ~/.config/nvim/autoload
ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
```

## Arch Linux AUR helper (yay)

```sh
git clone --depth=1 'https://aur.archlinux.org/yay-bin.git'
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin
```

## Proxy forwarder

```sh
# Debian-based OSes
sudo apt install redir
# Arch Linux
yay -S redir

# Install and enable systemd service
sudo install -m644 systemd/system/proxy-redir.service /etc/systemd/system/
sudo systemctl enable --now proxy-redir

# Note that you'll have to find the proxy application in Windows Firewall's
# settings, allow TCP connections from public networks, and add IP CIDR
# `172.16.0.0/12` to its scope.
# https://github.com/microsoft/WSL/issues/4139
```

## SSH agent as systemd service

```sh
cp -a config/systemd ~/.config/
systemctl --user enable --now ssh-agent
```

# Import custom configurations

```sh
cp Linux-config/zshrc .zshrc
cp Linux-config/zprofile .zprofile
cp Linux-config/gitconfig .gitconfig
cp -a Linux-config/vim .vim
sudo cp -R Linux-config/sudoers.d /etc/

git config --global http.proxy "$http_proxy"
```
