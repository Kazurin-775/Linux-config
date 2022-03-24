# Basic setup

## Packages (for Debian-based OSes)

```sh
# Basic packages
sudo apt install build-essential git zsh wget curl tmux vim p7zip-full

# Desktop environment
sudo apt install ibus-rime keepassxc
# Note: GNOME uses IBus by default
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
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

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

cargo install cargo-edit
```

## Neovim

```sh
# Install latest version (v0.6.1)
wget 'https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz'
(cd /opt && sudo tar xf ~/nvim-linux64.tar.gz)
sudo ln -s '/opt/nvim-linux64/bin/nvim' '/usr/local/bin/nvim'
rm nvim-linux64.tar.gz

# Apply configurations from Vim
mkdir -p ~/.config/nvim
ln -s ~/.vim/autoload ~/.config/nvim/autoload
ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
```

## Proxy forwarder

```sh
sudo install -m644 systemd/system/proxy-redir.service /etc/systemd/system/
sudo systemctl enable --now proxy-redir
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
