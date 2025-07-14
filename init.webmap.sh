#!/bin/bash

cd /opt && git clone https://github.com/PunitTailor55/WebMap.git

echo
echo "Usage"
echo "You should use this with docker, just by sending this command:"
echo
echo "
mkdir /tmp/webmap
docker run -d \
         --name webmap \
         -h webmap \
         -p 8000:8000 \
         -v /tmp/webmap:/opt/xml \
         rev3rse/webmap /run.sh
"
echo
echo "# now you can run Nmap and save the XML Report on /tmp/webmap"
echo "nmap -sT -A -T4 -oX /tmp/webmap/myscan.xml 192.168.1.0/24"
nmap -sT -A -T4 -oX /tmp/webmap/myscan.xml 192.168.1.0/24
echo
echo "Now point your browser to http://localhost:8000"
firefox http://localhost:8000
