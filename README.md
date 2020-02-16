New way for adlist only 2020-7-15  
Pihole beta 5

wget -qO - https://raw.githubusercontent.com/sml156/when_pigs_fly/master/adlist-up.sh > adlist-up.sh  
sudo chmod a+x adlist-up.sh  
sudo ./adlist-up.sh


try this March 2019

wget -qO - https://raw.githubusercontent.com/sml156/when_pigs_fly/master/test_white.sh > test_white.sh  
sudo chmod a+x test_white.sh  
sudo ./test_white.sh  


sudo nano /etc/dnsmasq.d/02-pihole-dhcp-DNS.conf
