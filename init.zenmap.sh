#!/bin/bash

cd /opt/omniscient/deb 
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/pygtk/python-gtk2_2.24.0-5.1ubuntu2_amd64.deb
sudo apt install ./python-gtk2_2.24.0-5.1ubuntu2_amd64.deb 

wget http://archive.ubuntu.com/ubuntu/pool/universe/n/nmap/zenmap_7.60-1ubuntu5_all.deb
sudo dpkg -i  /opt/omniscient/deb/zenmap_7.60-1ubuntu5_all.deb

