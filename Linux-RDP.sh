#! /bin/bash
printf "Installing Linux RDP Please Wait... " >&2
{
sudo useradd -m mr-x
sudo adduser mr-x sudo
echo 'mr-x:xxx' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
printf 'Installing desktop environment (kde-standard)'
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes kde-standard desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/plasmashell /usr/bin/kwin" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser mr-x chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - mr-x -c """$CRP"""
printf 'Access Your RDP At https://remotedesktop.google.com/access/ \n\n'
sudo apt-get upgrade

