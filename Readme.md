Vim configuration

Install this: https://github.com/vovkasm/input-source-switcher
Download https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
```bash
ln -s .vim/.vimrc ~/.vimrc
ln -s ~/.vim/init.vim .config/nvim/init.vim # neovim
```

Fullscreen autostart
```bash
alias vimr='vimr && ~/.vim/fullscreen.scpt'
```

Install additionally brew/oh-my-zsh/oh-my-posh/iterm and:
```bash
brew install mitmproxy jq yq httpie shellcheck oh-my-posh ykman htop neovim colima telnet tree dive docker bat colordiff pup yamllint kcat
```

Disable noisy alert:
```bash
sudo defaults write /Library/Preferences/com.apple.security.smartcard UserPairing -bool NO
```
