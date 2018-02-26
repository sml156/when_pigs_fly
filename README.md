# when_pigs_fly
PiHole Whitelist

Edit manually

sudo nano /etc/pihole/whitelist.txt


# Try this one day

sudo wget -qO - https://v.firebog.net/hosts/lists.php?type=all | sudo tee /etc/pihole/adlists.list

sudo -s

sudo curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt > /etc/pihole/whitelist.txt && pihole -g

