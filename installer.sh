#!/bin/bash

BASHRC="$HOME/.bashrc"
ZSHRC="$HOME/.zshrc"

# --- Install -------

installNeovim() {
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim-linux64
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm -rf nvim-linux64.tar.gz
}

addToPath() {
    local rc_file="$1"
    if [ -f "$rc_file" ]; then
        if [ -z "$(grep "nvim-linux64" "$rc_file")" ]; then
	    echo "Add to PATH"
            echo 'export PATH=$PATH:/opt/nvim-linux64/bin' >> "$rc_file"
        fi
    else
	echo "No RC file!"
    fi
}

installOneshot() {
    local shell_env=$1
    installNeovim
    if [ $shell_env == "bash" ]; then
        addToPath $BASHRC
    elif [ $shell_env == "zsh" ]; then
        addToPath $ZSHRC
    else
	echo "Unknown shell"
    fi
}

# --- remove -------

removeNeovim() {
    sudo rm -rf /opt/nvim-linux64
}

removeFromPath() {
    local rc_file="$1"
    if [ -f "$rc_file" ]; then
        if [ -n "$(grep "nvim-linux64" "$rc_file")" ]; then
	    echo "Remove from PATH"
            sed -i '/export PATH=\$PATH:\/opt\/nvim-linux64\/bin/d' "$rc_file"
        fi
    else
	echo "No RC file!"
    fi
}

removeOneshot() {
    local shell_env=$1
    removeNeovim
    if [ $shell_env == "bash" ]; then
        removeFromPath $BASHRC
    elif [ $shell_env == "zsh" ]; then
        removeFromPath $ZSHRC
    else
	echo "Unknown shell"
    fi	
}

# --- help --------

showHelp() {
    echo "Usage: installer.sh [-h] -i|-r zsh|bash "
    echo "    -i zsh|bash    Install Neovim"
    echo "    -r zsh|bash    Remove Neovim"
    echo "    -h             Show usage"
}

main() {
    while getopts 'i:r:h' OPT; do
        case $OPT in
            i) installOneshot $OPTARG;;
            r) removeOneshot $OPTARG;;
	    h) showHelp;;
            ?) showHelp
        esac
    done
}

main $@
#rc_file="$BASHRC"
#grep "nvim-linux64" "$rc_file" | wc -l

