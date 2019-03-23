# ##############################################
# Custom blacklist
# ##############################################

#pihole -b cdn.adfront.org tag.medialytics.com med.heyzap.com notify.bugsnag.com rt.applovin.com ns.zdbb.net omaze.com traffic.adxprts.com ads.exoclick.com adclickservice.com 2468.go2cloud.org d1lp05q4sghme9.cloudfront.net 4-edge-chat.facebook.com pleasedontslaymy.download cdn11.pleasedontslaymy.download engine.phn.doublepimp.com media.trafficjunky.net fbcdn-profile-a.akamaihd.net cf2.vuze.com tlootas.org badtopwitch.work eventtracking.omarsys.com almoraffiliates-api.omarsys.com www.sunnyplayer.com cdn.engine.spotscenered.info sunnyplayer-frontapi.cherrytech.com mh.tlootas.org spotscenered.info 
curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/blacklist.txt > /etc/pihole/blacklist.txt

# ##############################################
# Whitelist of domains (twitter, spotify, ...)
# ##############################################

# Clean out - to be sure
# echo "" | sudo tee /etc/pihole/whitelist.txt > /dev/null
# pihole -g

#pihole -w raw.githubusercontent.com mirror1.malwaredomains.com sysctl.org zeustracker.abuse.ch s3.amazonaws.com hosts-file.net spclient.wg.spotify.com udm.scorecardresearch.com analytics.twitter.com adaway.org v.firebog.net mirror.cedia.org.ec www.malwaredomainlist.com bitbucket.org openphish.com ransomwaretracker.abuse.ch github.com thepiratebay.org apple.com appleid.apple.com pornhub.com opensubtitles.org angryip.org imgur.com prod.imgur.map.fastlylb.net m.imgur.com 
curl -sS https://raw.githubusercontent.com/sml156/when_pigs_fly/master/whitelist.txt > /etc/pihole/whitelist.txt
# ##############################################
# Pi-Hole's block lists
# ##############################################
