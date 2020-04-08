# ##############################################
# Notes:
# Get script
# wget -qO - https://raw.githubusercontent.com/sml156/when_pigs_fly/master/test_white.sh > test_white.sh
# Make exicutable
# sudo chmod a+x test_white.sh
# Run script
# sudo ./test_white.sh
# ##############################################
# Renove all old lists
# rm -r /etc/pihole/*.list && echo "OK .list removed" || echo ".list Failed to remove"
# rm -r /etc/pihole/*.domains && echo "OK .domains removed" || echo ".domains failed to remove"
# ##############################################
# My blacklist on github
# ##############################################

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/blacklist.txt | tee /etc/pihole/blacklist.txt 1>/dev/null && echo "OK My Blacklist Copied" || echo "My Blacklist Failed"

# ##############################################
# My Whitelist on github
# ##############################################

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt | tee /etc/pihole/whitelist.txt 1>/dev/null && echo "OK My Whitelist copied" || echo "My Whitelist Failed"

# ##############################################
# My regex on github
# ##############################################

curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/regex.list | tee /etc/pihole/regex.list 1>/dev/null && echo "OK My Regex Copied" || echo "My Regex Failed"

# ##############################################
# Pi-Hole's block lists from https://wally3k.github.io
# ##############################################

echo " https://raw.githubusercontent.com/sml156/when_pigs_fly/master/blacklist_sites | tee /etc/pihole/adlists.list 1>/dev/null && echo "OK My Github Downloaded"  || echo "My Github Failed"
# Only pick one of these
### curl -sS https://v.firebog.net/hosts/lists.php?type=tick | tee /etc/pihole/adlists.list 1>/dev/null && echo "OK wally3k Downloaded"  || echo "wally3k Failed"
# curl -sS https://v.firebog.net/hosts/lists.php?type=nocross | tee /etc/pihole/adlists.list 1>/dev/null && echo "OK wally3k Downloaded"  || echo "wally3k Failed"
### curl -sS https://v.firebog.net/hosts/lists.php?type=all | tee /etc/pihole/adlists.list 1>/dev/null && echo "OK wally3k Downloaded"  || echo "wally3k Failed"

# Appened some new lists (NOTE: tee -a) from https://www.github.developerdan.com/hosts/ -2019-11-11 04:50:05
# Ads & Tracking -Updated semi regular-
# echo "https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt" | tee -a /etc/pihole/adlists.list > /dev/null && echo "OK My apended1 Downloaded"  || echo "My apended1 Failed Download"
# Tracking Aggressive -Updated semi regular-
# echo "https://www.github.developerdan.com/hosts/lists/tracking-aggressive-extended.txt" | tee -a /etc/pihole/adlists.list > /dev/null && echo "OK My apended2 Downloaded"  || echo "My apended2 Failed Download"
# AMP Hosts -Updated semi regular-
# echo "https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt" | tee -a /etc/pihole/adlists.list > /dev/null && echo "OK My apended3 Downloaded"  || echo "My apended3 Failed Download"


# ##############################################
# Update pihole
# ##############################################

pihole -g
