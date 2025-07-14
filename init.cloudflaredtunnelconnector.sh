

curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && 

sudo dpkg -i cloudflared.deb && 

sudo cloudflared service install eyJhIjoiN2QwMWMxZTc0M2RhNDE0YzEwODFiNmVmYmM4NjE1N2YiLCJ0IjoiZTQ4MGU4NDgtNGRjNC00ZTI5LWJkMjAtNThkOGMzNzc3NjQ1IiwicyI6IlpqRTRZekUyTXpRdFpXWXpNUzAwT1RWbExUazBabUV0WWpWaFltWTBOalF6TXpnMiJ9




sudo cloudflared service install eyJhIjoiN2QwMWMxZTc0M2RhNDE0YzEwODFiNmVmYmM4NjE1N2YiLCJ0IjoiZTQ4MGU4NDgtNGRjNC00ZTI5LWJkMjAtNThkOGMzNzc3NjQ1IiwicyI6IlpqRTRZekUyTXpRdFpXWXpNUzAwT1RWbExUazBabUV0WWpWaFltWTBOalF6TXpnMiJ9




sudo -s << echo '172.64.36.1 172.64.36.2' /etc/resolv.conf
