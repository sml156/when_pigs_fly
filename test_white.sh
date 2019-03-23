# ##############################################
# Notes:
# Get script
# wget -qO - https://raw.githubusercontent.com/sml156/when_pigs_fly/master/test_white.sh > test_white.sh
# Make exicutable
# sudo chmod a+x test_white.sh
# Run script
# sudo ./test_white.sh
# ##############################################

# ##############################################
# My blacklist on github
# ##############################################

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/blacklist.txt > /etc/pihole/$

# ##############################################
# My Whitelist on github
# ##############################################

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt > /etc/pihole/$

# ##############################################
# My regex on github
# ##############################################

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/regex.list > /etc/pihole/regex.list/$

# ##############################################
# Pi-Hole's block lists from https://wally3k.github.io
# ##############################################

wget -qO - https://v.firebog.net/hosts/lists.php?type=tick | tee /etc/pihole/adlists.list
wget -qO - https://v.firebog.net/hosts/lists.php?type=nocross | tee -a /etc/pihole/adlists.list

# ##############################################
# Template to add more domains
# echo "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | sudo tee -a /etc/pihole/adlists.list > /dev/null
# echo "https://mirror1.malwaredomains.com/files/justdomains" | sudo tee -a /etc/pihole/adlists.list > /dev/null
# ##############################################

# ##############################################
# Update pihole
# ##############################################

pihole -g
