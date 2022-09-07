#!/usr/bin/env bash

### Setting variables

CURRENT_DIR="${PWD}"
INSTALLER_HOME="${HOME}/villa/Lobby/installers"


printf -- '-%.0s' {1..50}; echo ""


### Installing zsh
# apt install zsh



#### TMUX ####

### Installing tmux
# apt install tmux



### Inside the Installer home

cd ${INSTALLER_HOME}

#### CHROME ####
[[ ! -f google-chrome-stable_current_amd64.deb ]] && \
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb



#### DISCORD ####
if [[ -f discord-0.0.15.deb ]]
then
  sudo dpkg -i discord-0.0.15.deb
else
  echo "Discord deb file not located"




##### SPOTIFY #####

### Installing rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

### Installing spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

### Supercharging spotify
[[ ! -d spotify-adblock ]] && git clone https://github.com/abba23/spotify-adblock.git
cd spotify-adblock
make
sudo make install




printf -- '-%.0s' {1..50}; echo ""


cd ${CURRENT_DIR}
