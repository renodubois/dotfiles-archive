# Home path
# TODO: Change this dynamically for macOS/Linux
set home_path "/Users/reno"

# PATH Modifications
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path "$home_path/.bin"
fish_add_path "$home_path/cargo/.bin"

# Remove default fish greeting
set fish_greeting ""

# NOTE: this might be bad
# set -gx COLORTERM truecolor
set -gx EDITOR nvim

# Default powerline prompt
set fish_function_path $fish_function_path "/opt/homebrew/lib/python3.9/site_packages/powerline/bindings/fish"

# Settings recommended by my prompt
# TODO: determine if these are actually useful
set -g theme_display_user yes
set -g theme_hostname always
set -g default_user reno 


# Init fast node manager (fnm)
fnm env | source

# Aliases
function ls
	command ls -la $argv
end
function vim
	command nvim $argv
end
function evim
	command nvim /home/reno/.config/nvim/init.vim
end
function pip
	command python3.9 -m pip $argv
end
function brew
	command arch -arm64 brew $argv
end
function brew64
	command arch -x86_64 /usr/local/bin/brew $argv
end
function dcr
	command docker-compose run $argv
end
# A very specific alias that lets me run Python inside of the Docker compose
# container used for the DSA site
function dcp
	command docker-compose run django python $argv
end

# Aliases to x86_64 versions of programs
function py64
	command /usr/local/bin/python3 $argv
end
