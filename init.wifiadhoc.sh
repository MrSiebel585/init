#!/bin/bash

echo "CREATE TEMPORARY WIRELESS ADHOC NETWORK TO CONNECT RPI CAMERA DIRECTLY TO ANDROID FOR MOTODASH CAM AND THEN REVERT BACK TO WEB INTERNET PROFILE FOR FAST SWITCHING..."; echo

cd /etc/network
sudo cp interfaces interfaces.original
sudo touch adhoc-interface

sudo <<< echo -e "
  auto lo
  iface lo inet loopback
  iface eth0 inet dhcp

  auto wlan0
  iface wlan0 inet static
  address 192.168.1.1
  netmask 255.255.255.0
  wireless-channel 4
  wireless-essid Project_6Cam
  wireless-mode ad-hoc

" > adhoc-interface


sudo apt-get install isc-dhcp-server

sudo nano /etc/dhcp/dhcpd.conf

sudo <<< echo -e "

  ddns-update-style interim;
  default-lease-time 600;
  max-lease-time 7200;
  authoritative;
  log-facility local7;
  subnet 192.168.1.0 netmask 255.255.255.0 {
   range 192.168.1.5 192.168.1.150;

  }

"

echo "Switching To Project_6Cam Ad-Hoc Network"; sudo cp /etc/network/adhoc-interface interfaces

echo "SWITCHING BACK TO WEB NETWORK INTERFACE AND ESTABLISHING CONNECTION TO INTERNET!"
echo "ENTER: sudo cp /etc/network/wifi-interface interfaces"

"
