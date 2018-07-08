# when_pigs_fly
PiHole Whitelist & Blacklist

Note:
I made this whitelist for me, anyone reading this should make their own based on their browsing habbits. Your welcome to use it but you really should make your own.

# Update addlists

sudo wget -qO - https://v.firebog.net/hosts/lists.php?type=tick | sudo tee /etc/pihole/adlists.list

# Update blacklists and gravity
sudo -s

sudo curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/blacklist.txt > /etc/pihole/blacklist.txt


# Update whitelists and gravity
sudo -s

sudo curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt > /etc/pihole/whitelist.txt && pihole -g

exit

# misc commands

# Top Domains (Those which aren't blocked):
nc "127.0.0.1" "$(cat /var/run/pihole-FTL.port)" -q 1 <<< ">top-domains(130)"
# Blocked Domains:
nc "127.0.0.1" "$(cat /var/run/pihole-FTL.port)" -q 1 <<< ">top-ads(130)"
# Single client
nc "127.0.0.1" "$(cat /var/run/pihole-FTL.port)" -q 1 <<< ">getallqueries-client 192.168.200.221"  
# Edit addlists
sudo nano /etc/pihole/adlists.list

