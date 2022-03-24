# Software for desktop environment

## f.lux

https://github.com/xflux-gui/fluxgui

```sh
# Debian-based OSes
sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo apt-get update
sudo apt-get install fluxgui
```

If HTTP 404 errors occur during `apt update`:

```sh
sudo vim /etc/apt/sources.list.d/nathan-renniewaldock-ubuntu-flux-*.list

# Replace CODENAME with `bionic`
```

To fix compatibility with 11-bit displays ([tracking issue](https://github.com/xflux-gui/fluxgui/issues/27)):

```sh
# Install xflux11
wget 'https://justgetflux.com/linux/xflux11.tgz'
(cd /usr/local/bin && tar xf ~/xflux11.tgz)
rm 'xflux11.tgz'

# Patch fluxgui to use xflux11
sudo patch '/usr/lib/python3/dist-packages/fluxgui/xfluxcontroller.py' <<EOF
77c77
<             self._xflux = pexpect.spawn("xflux", startup_args)
---
>             self._xflux = pexpect.spawn("xflux11", startup_args)
144c144
<         startup_args += ["-k", str(color), "-nofork"] # nofork is vital
---
>         startup_args += ["-k", str(color), "-r", "0", "-nofork"] # nofork is vital
EOF
```

## The Microsoft family

- https://www.microsoft.com/zh-cn/edge
- https://code.visualstudio.com/

Some hacks:

```sh
# Allow background + fix checksums for non-root users
sudo chmod o+w '/usr/share/code/resources/app'/{,'product.json','out/vs/workbench/workbench.desktop.main.css'}

# Revoke background + fix checksums
sudo chmod o-w '/usr/share/code/resources/app'/{,'product.json','out/vs/workbench/workbench.desktop.main.css'}
```

## Obsidian

https://github.com/obsidianmd/obsidian-releases/releases

## Typora

https://typora.io/

```sh
# Debian-based OSes
curl -sSL 'https://typora.io/linux/public-key.asc' | sudo gpg --dearmor -o '/usr/share/keyrings/typora-public-key.gpg'
echo 'deb [signed-by=/usr/share/keyrings/typora-public-key.gpg] https://typora.io/linux ./' | sudo tee '/etc/apt/sources.list.d/typora.list'
sudo apt update && sudo apt install typora
```
