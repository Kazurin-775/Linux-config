# Basic setup

## Packages (for Debian-based OSes)

```sh
# Basic packages
sudo apt install build-essential git zsh wget curl tmux vim p7zip-full htop aria2 pv silversearcher-ag python-is-python3

# CLI utilities
sudo apt install netcat-openbsd socat strace ltrace traceroute net-tools ngrep lsof nmap tcpdump

# Developer tools
sudo apt install nasm hexedit ipython3 git-absorb

# Desktop environment
sudo apt install ibus-rime keepassxc
# Note: GNOME uses IBus by default

# Linux kernel build dependencies
sudo apt install flex bison bc lib{ncurses,ssl,elf}-dev

# CTF tools (pwndbg and many other tools are not available via apt sources)
sudo apt install python3-pwntools radare2 binwalk patchelf elfutils
```

## Packages (for Arch Linux)

```sh
# Basic packages
sudo pacman -S base-devel git zsh wget curl tmux vim p7zip htop aria2 pv the_silver_searcher man-db man-pages cpio

# CLI utilities
sudo pacman -S openbsd-netcat socat strace ltrace traceroute net-tools ngrep lsof nmap tcpdump

# Developer tools
sudo pacman -S nasm hexedit ipython python-virtualenv git-absorb

# Desktop environment
sudo pacman -S ibus-rime keepassxc
# Note: GNOME uses IBus by default

# CTF tools
sudo pacman -S python-pwntools pwndbg radare2 binwalk patchelf elfutils
sudo pacman -S one_gadget ropper
yay -S pwninit-bin heaptrace
```

## zsh

```sh
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Nerd Fonts (for use in desktop environments)
NF_VER="$(curl -s 'https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest' | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"
echo "Downloading Nerd Fonts version $NF_VER"
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/$NF_VER/JetBrainsMono.zip"
mkdir -p ~/.local/share/fonts/JetBrainsMono-NF
(cd ~/.local/share/fonts/JetBrainsMono-NF && unzip ~/JetBrainsMono.zip)
rm JetBrainsMono.zip

# Powerlevel 10k
git clone --depth=1 'https://github.com/romkatv/powerlevel10k.git' "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# zsh-autosuggestions
git clone --depth=1 'https://github.com/zsh-users/zsh-autosuggestions.git' "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# tpm: the tmux plugin manager
git clone --depth=1 'https://github.com/tmux-plugins/tpm.git' ~/.config/tmux/plugins/tpm
# Press <Ctrl-b I> to install plugins; tmux may freeze for a while before the installation completes.
```

## Rust

```sh
# Arch Linux
sudo pacman -S rustup

# Manually install rustup
curl --proto '=https' --tlsv1.3 -sSf https://sh.rustup.rs | sh

# Configure alternative Cargo registry
mkdir ~/.cargo
cat > ~/.cargo/config.toml <<EOF
[source.crates-io]
replace-with = 'mirror'

[source.mirror]
registry = 'sparse+https://mirrors6.tuna.tsinghua.edu.cn/crates.io-index/'
EOF

# Install helper tools
cargo install cargo-edit
```

## Install pwndbg on Ubuntu

```sh
git clone --depth=1 https://github.com/pwndbg/pwndbg.git -b 2024.02.14
cd pwndbg
./setup.sh
```

## Install various CTF tools on Ubuntu

```sh
sudo gem install one_gadget
cargo install pwninit
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

cp -a Linux-config/config/tmux .config/
cp -a Linux-config/config/tmux-powerline .config/

sudo cp -R Linux-config/sudoers.d /etc/
sudo cp -R Linux-config/systemd /etc/
```
