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

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/blacklist.txt | tee /etc/pihole/blacklist.txt 1>/dev/null && echo "OK Blacklist Copied" || echo "Blacklist Failed"
curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/black.list | tee /etc/pihole/black.list 1>/dev/null && echo "OK Blacklist2 Copied" || echo "Blacklist2 Failed"
# ##############################################
# My Whitelist on github
# ##############################################

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt | tee /etc/pihole/whitelist.txt 1>/dev/null && echo "OK Whitelist copied" || echo "Whitelist Failed"

# ##############################################
# My regex on github
# ##############################################

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/regex.list | tee /etc/pihole/regex.list 1>/dev/null && echo OK "Regex Copied" || echo "Regex Failed"

# ##############################################
# Pi-Hole's block lists from https://wally3k.github.io
# Remove comment from only one, Do not use all
# ##############################################

#wget -qO - https://v.firebog.net/hosts/lists.php?type=tick | tee /etc/pihole/adlists.list 1>/dev/null && echo OK "wally3k Downloaded"  || echo "wally3k Failed Download"
wget -qO - https://v.firebog.net/hosts/lists.php?type=nocross | tee /etc/pihole/adlists.list 1>/dev/null && echo OK "wally3k Downloaded"  || echo "wally3k Failed Download"
#wget -qO - https://v.firebog.net/hosts/lists.php?type=all | tee /etc/pihole/adlists.list 1>/dev/null && echo OK "wally3k Downloaded"  || echo "wally3k Failed Download"

# something wrong here worked fine yesterday
# Appened some new lists from https://www.github.developerdan.com/hosts/ -2019-11-11 04:50:05
# Ads & Tracking
# echo "https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt" | sudo tee -a /etc/pihole/adlists.list > /dev/null && echo OK "apended1 Downloaded"  || echo "apended1 Failed Download"
# Tracking Aggressive
# echo "https://www.github.developerdan.com/hosts/lists/tracking-aggressive-extended.txt" | sudo tee -a /etc/pihole/adlists.list > /dev/null && echo OK "apended2 Downloaded"  || echo "apended2 Failed Download"
# AMP Hosts
# echo "https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt" | sudo tee -a /etc/pihole/adlists.list > /dev/null && echo OK "apended3 Downloaded"  || echo "apended3 Failed Download"




# ##############################################
# Template to add more domains NOTE: Be aware whether you want to append EG:  -a  or not append
# echo "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | sudo tee -a /etc/pihole/adlists.list > /dev/null
# echo "https://mirror1.malwaredomains.com/files/justdomains" | sudo tee -a /etc/pihole/adlists.list > /dev/null
# ##############################################

# ##############################################
# Update pihole
# ##############################################

pihole -g
