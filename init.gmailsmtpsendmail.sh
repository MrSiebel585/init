To clean up, standardize, and improve readability of the previous Bash script, you can follow these steps:

1. Update and install the required packages: sudo apt-get update && sudo apt-get install -y sendmail sendmail-cf

2. Backup the original Sendmail.mc, Sendmail.cf, and AuthInfo files: sudo cp /etc/mail/sendmail.mc /etc/mail/sendmail.mc.backup && sudo cp /etc/mail/sendmail.cf /etc/mail/sendmail.cf.backup

3. Adjust permissions if necessary: If the original Sendmail.mc and AuthInfo files are owned by root with group access, then change their mode to 640 (rwx---): sudo chmod 640 /etc/mail/*.*

4. Configure Sendmail to use Gmail's SMTP relay:
    1. Add the following lines in your existing Sendmail.mc file (if not, create a new one with the new configuration):
         ```
         MAILER(local)
         MODULE('SMTP')
         MODULE('smtp')
         MAILER(smtp)
         define('CONFQUEUE_DIRECTORY', '/var/spool/mqueue')
         ```
    2. If you don't have an existing AuthInfo file, create one with the new Gmail credentials:
         ```
         AuthInfo: 'U:root' 'I:wacrochester@gmail.com' 'P:SuckMyDick716!!!'
         ```
    3. Restart Sendmail service if necessary: sudo systemctl restart sendmail.service

5. Check that the script is working properly:
    1. Execute a test email using the new Sendmail configuration:
         ```
         echo "Test message" | sendmail -t -s 'Test subject' root@localhost
         ```
    2. If everything is working correctly, check the authenticated email sender and recipient in the authinfo file:
         ```
         AuthInfo: 'U:root' 'I:wacrochester@gmail.com' 'P:SuckMyDiick716!!!'
         ```
    3. If necessary, adjust the original Sendmail.mc and/or AuthInfo files as needed.

6. Clean up and archive any leftover files or directories:
    1. Backup the AuthInfo file: sudo mv /etc/mail/authinfo/gmail-auth /etc/mail/authinfo/gmail-auth.backup
    2. Remove any unneeded directories, if any: sudo rm -rf /var/spool/mqueue
    3. Archive the original Sendmail.mc and AuthInfo files: sudo tar -C / -zcvf /var/backups/sendmail-original.tar.gz -C /etc/mail/ /etc/mail/
    4. Delete any temporary or unnecessary directories created during the script execution: sudo rm -rf /tmp/*
