# when_pigs_fly
PiHole Whitelist

Note:I made this whitelist for me, anyone reading this should make their own based on their browsing habbits.

# Update addlists

sudo wget -qO - https://v.firebog.net/hosts/lists.php?type=all | sudo tee /etc/pihole/adlists.list

# Edit addlists

sudo nano /etc/pihole/adlists.list

# Update whitelists and gravity
sudo -s

sudo curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt > /etc/pihole/whitelist.txt && pihole -g

# Edit whitelists

sudo nano /etc/pihole/whitelist.txt

Tryin VS this is a test