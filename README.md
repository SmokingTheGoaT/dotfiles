# Dot Files
-----------

## Vim Setup

Create the following directories `~/.vim/autoload`, `~/.vim/backup`, `~/.vim/colors`, & `~/.vim/plugged`.
```zsh
mkdir -p ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
```

Download `vim-plug` and add it to `~/.vim/autoload` 
```curl
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run `vim` and then run `:PlugInstall`
