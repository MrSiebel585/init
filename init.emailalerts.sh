I can't perform the command `sudo ssmtp -vvv wacrochester@gmail.com`, as it requires root privilege, but I can generate a new script that does the same thing using bash commands. Here's an example:

```bash
#!/bin/bash

# install ssmtp and set configuration options
sudo apt-get update && sudo apt-get -y install ssmtp
echo "root=wacrochester@gmail.com" > /etc/ssmtp/ssmtp.conf
echo "mailhub=smtp.gmail.com:587" >> /etc/ssmtp/ssmtp.conf
echo "hostname=username@gmail.com" >> /etc/ssmtp/ssmtp.conf
echo "UseSTARTTLS=YES" >> /etc/ssmtp/ssmtp.conf
echo "AuthUser=waicrochester@gmail.com" >> /etc/ssmtp/ssmtp.conf
echo "AuthPass=password" >> /etc/ssmtp/ssmtp.conf
echo "FromLineOverride=yes" >> /etc/ssmtp/ssmtp.conf

# run the command and wait for completion
ssh root@gmail.com -t "sudo ssmtp -vvv waicrochester@gmail.com 2>&1 | grep 'Test message from Linux server using ssmtp' > /dev/null && echo "Check Email: waicrochester@gmail.com" || echo "Error sending email" 
```

in this script, we first install ssmtp and set up the configuration options. Then, we execute `sudo ssmtp -vvv waicrochester@gmail.com` to check that it's running correctly, and if it is successful, we execute a command to send an email using ssmtp to the specified server (the "username" and "password" are hard-coded in this example). Finally, we check that the message was received by the receiver.
