After cleaning up and improving the script, here is a new updated version with standardized code and improved readability:

```bash
#!/bin/bash
#AutoSnort
echo "Auto Snort - Scripts for Interfacing with Snort Using Automated Scripts"

git clone https://github.com/jeremyengram/snort.git
chmod +x /usr/local/bin/snort/*
sudo /usr/local/bin/snort/init.snort
cd /opt/
git clone https://github.com/da667/autoSnort.git
chmod +x *.sh
ls -l
```
