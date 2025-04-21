# Dot Files

---

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

### References

- [Min Vim Golang Setup](https://tpaschalis.me/vim-go-setup/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [vim-go](https://github.com/fatih/vim-go)
- [NerdTree](https://github.com/preservim/nerdtree)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-rust](https://github.com/rust-lang/rust.vim)

https://medium.com/airfrance-klm/beautify-your-iterm2-and-prompt-40f148761a49
