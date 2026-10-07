which vim > /dev/null && export EDITOR='vim'
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"

# Rustup mirrors
export RUSTUP_DIST_SERVER='https://mirrors.ustc.edu.cn/rust-static'
export RUSTUP_UPDATE_ROOT='https://mirrors.ustc.edu.cn/rust-static/rustup'

# Enable Homebrew mirrors for macOS only
if [ -f '/System/Library/LaunchAgents/com.apple.Finder.plist' ]; then
    export HOMEBREW_BREW_GIT_REMOTE='https://mirrors.ustc.edu.cn/brew.git'
    export HOMEBREW_ARTIFACT_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
    export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
fi
