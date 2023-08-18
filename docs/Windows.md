## PowerShell setup

See [PowerShell.md](./PowerShell.md).

## Windows Terminal fonts

- [be5invis/Sarasa-Gothic](https://github.com/be5invis/Sarasa-Gothic)
- [jonz94/Sarasa-Gothic-Nerd-Fonts](https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts)

## WSL 2

```ps1
# Install WSL and kernel
wsl --install --no-distribution

# Or manually enable WSL features with...
OptionalFeatures.exe
# (Enable VM platform + hypervisor platform + WSL)

# Set WSL 2 as default (just in case)
wsl --set-default-version 2
```

Then, **reboot the system once** before installing any Linux distribution.

Official M\$ docs for WSL: [安装 WSL](https://learn.microsoft.com/zh-cn/windows/wsl/install)

## Arch Linux on WSL

Refer to [yuk7/ArchWSL](https://github.com/yuk7/ArchWSL) for installation.

Fix outdated Arch Linux keyring:

```sh
nano /etc/pacman.d/mirrorlist
pacman -Sy archlinux-keyring
pacman -Syu
# pacman-key --populate
```

- For addition setup steps, refer to [Setup after install - ArchWSL docs](https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/#setup-after-install)
- If the first-run script fails to perform its work, don't do a full re-install. Instead, manually perform the remaining work in this file: [ArchWSL-FS/bash\_profile](https://github.com/yuk7/ArchWSL-FS/blob/main/bash_profile)

## Rust

1. Install **Visual Studio Build Tools** or **Visual Studio** ([link](https://visualstudio.microsoft.com/zh-hans/downloads/));
2. Go to https://rustup.rs/ and download `rustup-init.exe`;
3. Set up a Rustup mirror, set environment variables `RUSTUP_DIST_SERVER` and `RUSTUP_UPDATE_ROOT` accordingly;
4. Install the Rust toolchain;
5. Configure a Cargo mirror (edit `~/.cargo/config.toml`).

If looking for installing Rust in a directory other than `$USERPROFILE`, set environment variables `RUSTUP_HOME` and `CARGO_HOME` accordingly.

Example of using `setx.exe` to set up environment variables:

```pwsh
setx 'RUSTUP_DIST_SERVER' 'https://mirrors.ustc.edu.cn/rust-static'
setx 'RUSTUP_UPDATE_ROOT' 'https://mirrors.ustc.edu.cn/rust-static/rustup'

setx 'RUSTUP_HOME' 'D:\Dev\Rust\rustup'
setx 'CARGO_HOME'  'D:\Dev\Rust\cargo'
```
