#!/bin/bash
# copy pasted from " https://github.com/dMopp/pihole5-adlist-update-cron "
#####CHANGE STUFF HERE
# curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/blacklist.txt | tee /etc/pihole/blacklist.txt 1>/dev/null && echo "OK My Blacklist Copied" || echo "My Blacklist Failed"
# curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/black.list | tee /etc/pihole/black.list 1>/dev/null && echo "OK My Blacklist2 Copied" || echo "My Blacklist2 Failed"
# curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt | tee /etc/pihole/whitelist.txt 1>/dev/null && echo "OK My Whitelist copied" || echo "My Whitelist Failed"

PIHOLE_DIR="/etc/pihole"
ADLIST_URL="https://v.firebog.net/hosts/lists.php?type=nocross"
# Ads & Tracking -Updated semi regular-
echo "https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt" | tee -a /etc/pihole/adlists.list > /dev/null && echo "OK My apended1 Downloaded"  || echo "My apended1 Failed Download"
# Tracking Aggressive -Updated semi regular-
echo "https://www.github.developerdan.com/hosts/lists/tracking-aggressive-extended.txt" | tee -a /etc/pihole/adlists.list > /dev/null && echo "OK My apended2 Downloaded"  || echo "My apended2 Failed Download"
# AMP Hosts -Updated semi regular-
echo "https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt" | tee -a /etc/pihole/adlists.list > /dev/null && echo "OK My apended3 Downloaded"  || echo "My apended3 Failed Download"

CLEAN_ADLISTS_BEFORE_UPDATE=true


#####DO NOT CHANGE
#####Variables
DATE=$(date '+%Y-%m-%d')
ADLIST="${PIHOLE_DIR}/adlists.list"
FLUSH_SQL="${PIHOLE_DIR}/FLUSH.sql"
IMPORT_SQL="${PIHOLE_DIR}/IMPORT.sql"
GRAVITY_DB="${PIHOLE_DIR}/gravity.db"


#####Fetch Files
echo "Downloading Adlist(s)"
wget -O ${ADLIST} ${ADLIST_URL}

#####GENERATE SQL
echo "Generating SQL files..."
cat <<EOF > ${FLUSH_SQL}
DELETE FROM adlist;
EOF

cat <<EOF > ${IMPORT_SQL}
CREATE TEMP TABLE i(txt);
.separator ~
.import ${ADLIST} i
INSERT OR IGNORE INTO adlist (address) SELECT txt FROM i;
DROP TABLE i;
EOF

#####CLEANUP DB (if selected)
if ${CLEAN_ADLISTS_BEFORE_UPDATE}; then
	echo "Cleanup DB..."
	sqlite3 ${GRAVITY_DB} < ${FLUSH_SQL}
fi

#####IMPORT FILE to DB
echo "Import Adlist(s)..."
sqlite3 ${GRAVITY_DB} < ${IMPORT_SQL}
pihole -g

###CLEANUP
echo "Cleaning up..."
rm ${ADLIST}
rm ${FLUSH_SQL}
rm ${IMPORT_SQL}
