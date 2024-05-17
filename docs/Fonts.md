## JetBrains Mono

```sh
wget 'https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip'
mkdir -p ~/.local/share/fonts/JetBrainsMono
cd ~/.local/share/fonts/JetBrainsMono
7z x ~/JetBrainsMono-2.304.zip 'fonts/ttf/*.ttf'
mv fonts/ttf/* ./
rm -r fonts
rm ~/JetBrainsMono-2.304.zip
```

## Monaspace

```sh
wget 'https://github.com/githubnext/monaspace/releases/download/v1.000/monaspace-v1.000.zip'
mkdir -p ~/.local/share/fonts/Monaspace
cd ~/.local/share/fonts/Monaspace
7z x ~/monaspace-v1.000.zip 'monaspace-v1.000/fonts/otf/*.otf'
mv monaspace-v1.000/fonts/otf/* ./
rm -r monaspace-v1.000
rm ~/monaspace-v1.000.zip
```
