sudo bash -c 'for f in /opt/omniscient/init/init.*; do [[ -f "$f" && "$f" != *.sh ]] && mv "$f" "$f.sh"; done; chmod +x /opt/omniscient/init/init.*.sh'

