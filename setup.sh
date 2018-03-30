#! /usr/bin/env bash
RUNTIME=~/.vim_runtime 

git clone https://github.com/willfish/vimrc $RUNTIME

cat > ~/.vimrc <<VIMRC 
source $RUNTIME/vimrcs/vundle.vim
source $RUNTIME/vimrcs/basic.vim
source $RUNTIME/vimrcs/filetypes.vim
source $RUNTIME/vimrcs/plugins_config.vim
VIMRC

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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
echo "  :PluginInstall"
echo "  :checkhealth"
