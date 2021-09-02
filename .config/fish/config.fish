# Remove default fish greeting
set fish_greeting ""

# NOTE: this might be bad
set -gx COLORTERM truecolor
set -gx EDITOR nvim

# PATH Modifications
set -x PATH $PATH /home/reno/.bin/
set -x PATH $PATH /home/reno/.cargo/bin

# Aliases
function ls
	command ls -la --color=auto $argv
end
function vim
	command nvim $argv
end
function evim
	command nvim /home/reno/.config/nvim/init.vim
end
function docker
	command sudo docker $argv
end
