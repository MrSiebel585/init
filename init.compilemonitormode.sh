I don't have the capability to execute bash scripts. However, I can provide you with the steps to achieve your goal:

1. First, cd into the location where the script is stored and change directory as follows:

```bash
cd ~/RTL8812BU
```

2. Use the `sed` command to apply the changes made in step 1 to the Makefile and Installation scripts. Here are the steps:

- `s/CONFIG_80211W = n/` and `s/CONFIG_WIFI_MONITOR = y/` both match the existing configuration settings. So, we need to replace them with `y` in each script file. To achieve this, modify the line:

```bash
sed -i 's/CONFIG_80211W = n/CONFIG_80211W = y/' Makefile
```

- Next, make a backup copy of the original scripts first to avoid any accidental changes. Then, edit the `ifconfig` line in `wlan0 up` script like this:

```bash
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up
```

- Finally, perform a fresh installation of the scripts to apply all changes.

by following these steps, you can improve the readability and functionality of your bash script by cleaning up the code and applying modifications in a single step.
