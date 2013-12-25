## Installation

* clone repo to `~/.dotfiles` folder:

```
cd ~
git clone https://github.com/Remchi/dotfiles.git .dotfiles
```

* create symbolic links to config files

```
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/zshrc .zshrc
ln -s .dotfiles/vim .vim
ln -s .dotfiles/emacs .emacd.d
```

## Emacs

* install cask (http://cask.github.io/installation/):

```
curl -fsSkL https://raw.github.com/cask/cask/master/go | python
```

* run cask in `.emacs.d` folder

```
cd ~/.emacs.d
cask
```

