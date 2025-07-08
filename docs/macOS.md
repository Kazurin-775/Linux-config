## Homebrew

https://brew.sh/

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Oh My Zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then follow [SETUP.md](../SETUP.md) for other steps.

## Fonts

```sh
brew install --cask font-jetbrains-mono

brew install --cask font-meslo-lg-nerd-font
```

Then set `"MesloLGM Nerd Font"` as the terminal font.

## Alacritty

```sh
brew install --cask alacritty

mkdir -p ~/.config/alacritty/
cp alacritty.toml ~/.config/alacritty/
```

## Unlock Apple Intelligence

https://github.com/kanshurichard/enableAppleAI

## Stop Finder from creating DS_Stores on external drives

```sh
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
```
