# when_pigs_fly
PiHole Whitelist

Note:
I made this whitelist for me, anyone reading this should make their own based on their browsing habbits. Your welcome to use it but you really should make your own.

# Update addlists

sudo wget -qO - https://v.firebog.net/hosts/lists.php?type=tick | sudo tee /etc/pihole/adlists.list

# Edit addlists

sudo nano /etc/pihole/adlists.list

# Update blacklists and gravity
sudo -s

sudo curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/blacklist.txt > /etc/pihole/blacklist.txt && pihole -g


exit


# Update whitelists and gravity
sudo -s

sudo curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt > /etc/pihole/whitelist.txt && pihole -g


exit
