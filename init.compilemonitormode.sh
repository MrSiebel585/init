#!/bin/bash

echo "Compiling RTL8812BU for Monitor Mode!"

cd ~/RTL8812BU; pwd

sed -i 's/CONFIG_80211W = n/CONFIG_80211W = y/' Makefile
sed -i 's/CONFIG_WIFI_MONITOR = n/CONFIG_WIFI_MONITOR = y/' Makefile

make
sudo make install
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up
