#! /usr/bin/env bash
RUNTIME=~/.vim_runtime

git clone https://github.com/willfish/vimrc $RUNTIME

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cat >~/.vimrc <<VIMRC
source $RUNTIME/vimrcs/plugs.vim
source $RUNTIME/vimrcs/basic.vim
source $RUNTIME/vimrcs/filetypes.vim
source $RUNTIME/vimrcs/plugins_config.vim
VIMRC

echo "Install and configure homebrew:"
echo "  /usr/bin/ruby -e \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
echo "brew install node"
echo
echo "Install and configure:"
echo "  rbenv, pyenv, exenv "
echo
echo "Install the following:"
echo "  gem install haml-lint erubi brakeman rails_best_practices rubocop"
echo "  pip install vint"
echo "  npm install -g eslint"
echo
echo "Open nvim and run the following:"
echo "  :checkhealth"
echo "  :PlugInstall"
