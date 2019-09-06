#! /bin/bash 

type -t git >/dev/null 
if [[ $? != 0 ]]; then
    echo "Please install git"
    exit
fi

type -t curl >/dev/null 
if [[ $? != 0 ]]; then
    echo "Please install curl"
    exit
fi

git clone https://github.com/mikeTWC1984/pwshise
cd pwshise
# update your shell profile with ise stuff
echo "export ISE_HOME=$PWD" >> ~/.bashrc
echo 'PATH="$PATH:$ISE_HOME/bin"' >> ~/.bashrc 


# ------------- Downloading binaries ---------------------------------------------------

# Download VIM Plug
echo -e "$GREEN Downloading vim plug $NC"
curl -L -o plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download NeoVIM binaries
echo -e "$GREEN Downloading NeoVim Binaries$NC"
nvimurl="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"
curl -L -o nvim.tmp $nvimurl
tar xf nvim.tmp -C ./nvim --strip 1


# Download nodejs/npm binaries (for coc.nvim)
echo -e "$GREEN Downloading Node/Npm Binaries$NC"
nodeurl="https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.gz" 
curl -L -o node.tmp $nodeurl 
tar xf node.tmp -C ./node --strip 1


# Uncomment below section to download custom pwsh binaries (eg preview)
#echo -e "$GREEN Downloading Powershell Binaries$NC"
#pwshurl="https://github.com/PowerShell/PowerShell/releases/download/v7.0.0-preview.3/powershell-7.0.0-preview.3-linux-x64.tar.gz"
#curl -L -o pwsh.tmp $pwshurl 
#tar xf pwsh.tmp -C ./powershell

# remove temp files
rm *.tmp


#Install Plugins
./nvim/bin/nvim -u init.vim --headless +PlugInstall +qall > /dev/null 2>&1

# add ise shortcut to path
chmod 755 ./bin/ise

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
echo -e "$GREEN Install completed. Restart your shell or run $YELLOW source ~/.bashrc $GREEN to enable ise alias${NC}"
echo -e "$GREEN Then type ise and wait until you see $YELLOW'Coc-PowerShell installed'$NC"

