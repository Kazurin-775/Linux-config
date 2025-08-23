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

# If on Windows 11, grab the latest WSL features!
wsl --update

# Set WSL 2 as default (just in case)
wsl --set-default-version 2

# Import .wslconfig
cp Linux-config\wslconfig ~\.wslconfig

# In Windows Firewall, allow all inbound connections from WSL
# FIXME: this firewall rule loses effect after every reboot
# https://github.com/microsoft/WSL/issues/4585#issuecomment-610061194
New-NetFirewallRule -DisplayName 'WSL' `
    -Direction Inbound -Action Allow `
    -InterfaceAlias 'vEthernet (WSL (Hyper-V firewall))'

# Completely disable Windows Firewall for WSL
# Note that this leaves a red X in the Windows Security tray icon.
# https://superuser.com/questions/1714002/wsl2-connect-to-host-without-disabling-the-windows-firewall
Set-NetFirewallProfile -Profile Public -DisabledInterfaceAliases 'vEthernet (WSL (Hyper-V firewall))'

# Allow connections to a specific app from WSL
# Note: if there are any "block" rules configured for the same app, they should be disabled in wf.msc
# before the following rule can work.
New-NetFirewallRule -DisplayName 'App from WSL' `
    -Direction Inbound -Action Allow `
    -Program 'C:\foo\bar.exe' `
    -Protocol TCP -LocalPort 7897 `
    -RemoteAddress 172.23.128.0/20 `
    -Enabled True
```

Then, **reboot the system once** before installing any Linux distribution.

Official M\$ docs for WSL: [安装 WSL](https://learn.microsoft.com/zh-cn/windows/wsl/install)

## Arch Linux on WSL

Refer to [yuk7/ArchWSL](https://github.com/yuk7/ArchWSL) for installation.

Fix outdated Arch Linux keyring:

```sh
nano /etc/pacman.d/mirrorlist
pacman-key --init
pacman-key --populate
pacman -Syu
```

- For addition setup steps, refer to [Setup after install - ArchWSL docs](https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/#setup-after-install)
- If the first-run script fails to perform its work, don't do a full re-install. Instead, manually perform the remaining work in this file: [ArchWSL-FS/bash\_profile](https://github.com/yuk7/ArchWSL-FS/blob/main/bash_profile)

Cleanup (for mysophobia):

```sh
sudo pacman -Rsn arch-install-scripts
sudo pacman -D --asdeps sudo
```

## Enable systemd support in WSL 2

```sh
sudo tee /etc/wsl.conf <<EOF
[boot]
systemd = true

# Don't run Windows programs
[interop]
enabled = false
appendWindowsPath = false
EOF
```

## Rust on Windows

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
