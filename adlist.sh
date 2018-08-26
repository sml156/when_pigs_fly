#!/bin/bash
# run with sudo ./
# sudo chmod a+x adlists.sh
# Most of this was copy-pasted from the net, Most likely one of the PiHole forums 
# https://www.reddit.com/r/pihole/hot/
# https://discourse.pi-hole.net/
# https://pi-hole.net/blog/
# https://twitter.com/The_Pi_Hole



if [ "$(id -u)" != "0" ] ; then
        echo "run this script as root"
        exit 2
fi

if [ ! -f /etc/pihole/personal-adlists.list ] ; then
        touch /etc/pihole/personal-adlists.list
fi


# Grab my white-list and black-lists
echo "$(tput setaf 0) $(tput setab 7)               ...Add My Blacklist...                    $(tput sgr 0)"
sudo curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/blacklist.txt > /etc/pihole/blacklist.txt
echo "$(tput setaf 0) $(tput setab 7)               ...Done...                    $(tput sgr 0)"
echo "$(tput setaf 0) $(tput setab 7)               ...Add My Whitelist...                    $(tput sgr 0)"

sudo curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt > /etc/pihole/whitelist.txt
echo "$(tput setaf 0) $(tput setab 7)               ...Done...                    $(tput sgr 0)" 

# Just the tick list -- uncomment other list
# sudo wget -qO - https://v.firebog.net/hosts/lists.php?type=tick | sudo tee /etc/pihole/adlists.list # old way

sudo wget -qO - https://v.firebog.net/hosts/lists.php?type=tick | sudo tee /etc/pihole/personal-adlists.list

# Uncomment  if you have /etc/pihole/personal-adlists.list


cat /etc/pihole/personal-adlists.list <(wget -qO - https://v.firebog.net/hosts/lists.php?type=nocross 2> /dev/null) | sudo tee /etc/pihole/adlist.list

# wget -qO - https://v.firebog.net/hosts/lists.php?type=nocross 2 | sudo tee /etc/pihole/adlists.list
echo "$(tput setaf 0) $(tput setab 7)               ...Done...                    $(tput sgr 0)"

# Update the adlists
# pihole -g


#  sudo curl -sSL https://raw.githubusercontent.com/sml156/when_pigs_fly/master/adlist.sh | ./
