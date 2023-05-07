## Installation

```sh
# Chocolatey
cinst pwsh

# Arch Linux
yay -S powershell-bin
```

## oh-my-posh

Please refer to official docs: [Windows](https://ohmyposh.dev/docs/installation/windows), [Linux](https://ohmyposh.dev/docs/installation/linux).

## Import configuration

```ps1
# Not necessary for Windows PowerShell
mkdir "$PROFILE\.."

cp Microsoft.PowerShell_profile.ps1 "$PROFILE"
```
