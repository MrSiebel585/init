I don't have access to the bash script you provided, but based on the information provided in the script, it looks like you are trying to install cloudflared using a deb package and configure its services after installation. To do so, you need to follow these steps:

1. Remove the original dpkg -i command that was used to install cloudflared. This will remove all existing cloudflared files from your system.

2. Start by running the following command in order to uninstall any previous version of cloudflared if it is already installed on your system:

   ```bash
   sudo apt-get purge cloudflared*
   ```

3. Now, create a new dpkg -i file using the curl command and pass it to your terminal as follows:

   ```bash
   curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/release${VERSION}.${PATCH}/download/cloudflared-linux-amd64.deb && 
   
   sudo dpkg -i cloudflared.deb && 
   
   sudo cloudflared service install eyJhIjoiN2QwMWMxZTc0M2RhNDE0YzEwODFiNmVmYmM4NjE1N2YiLCJ0IjoiZTQ4MGU4NDgtNGRjNC00ZTI5LWJkMjAtNThkOGMzNzc3NjQ1IiwicyI6IlpqRTRZekUyTXpRdFpXWXpNUzAwT1RWbExUazBabUV0WWpWaFltWTBOalF6TXpnMiJ9
   ```

where ${VERSION} is the version of cloudflared you want to install, and ${PATCH} is the patch level. Replace "cloudflared" with the actual name of your cloudflared package. The third command executes the dpkg -i file, which installs the software package. The fourth command configures the services after installation by using `sudo cloudflared service install`. Once the services are configured, you can monitor their status using `systemctl status`.
