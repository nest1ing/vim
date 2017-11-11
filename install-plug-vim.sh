#!/bin/sh

TARGET=${1:-vim}

case ${TARGET} in
    vim)
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        ;;
        
    neovim)
        curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        ;;

    *)
        echo "Usage: $0 <vim | neovim>"
        exit 1
        ;;
esac
