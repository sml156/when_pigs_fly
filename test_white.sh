# Copy Pasted from https://github.com/Kevin-De-Koninck/pi-hole-helpers
# restore the default pihole list:
# cp -f /etc/.pihole/adlists.default /etc/pihole/adlists.list && pihole -g

# ##############################################
# My Custom blacklist from Github
# ##############################################

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/blacklist.txt > /etc/pihole/blacklist.txt

# ##############################################
# # add my list from github
# ##############################################

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt > /etc/pihole/whitelist.txt

# ##############################################
# Pi-Hole's block lists
# ##############################################

wget -qO - https://v.firebog.net/hosts/lists.php?type=tick | tee /etc/pihole/personal-adlists.list

# cat /etc/pihole/personal-adlists.list <(wget -qO - https://v.firebog.net/hosts/lists.php?type=nocross 2> /dev/null) | tee /etc/pihole/adlists.list

pihole -g
