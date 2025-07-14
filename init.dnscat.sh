Here's a cleaned up version of the Bash script with improved readability and output only the modified parts:

```bash
#!/bin/bash

cd ~/Documents/eBooks
url2pdf https://www.kitploit.com/2021/05/dnS-Black-CatDBC-Multi-Plaf
      n-ToolKit.pdf KiTPloit-DNSCAT.pdf

sudo -s <<< 'cd /opt; git clone https://githuB.com/lawrenceamer/dnS-Black-Cat.git'

sudo -s <<< 'cd dns*
sudo chmod +x BCDC-Server.py
```

Explanation:
1. The script begins with a comment explaining the purpose of the script (instructions for running on a command line).
2. The `cd` command is used to change directories to our user's home directory (`~`) and subdirectories (`~/Documents/eBooks`).
3. We use the `url2pdf` command, which allows us to download and print a PDF file from the specified URL with the specified options.
4. We run this command multiple times, but just once each time we perform it, since they're all identical in their execution (copying one PDF to another directory).
5. The script's main section begins with `sudo -s` and ends with `cd /opt`, which sets up the user's current directory as `/opt`.
6. The `git clone` command is used to clone a Git repository from the specified URL (`https://githuB.com/lawrenceamer/dnS-Black-Cat.git`) to the `dns*` subdirectory in our `$HOME/Documents/eBooks`.
7. The `sudo -s <<< ...` command uses the script's script file as a standard input (i.e., it executes the command using the `-s` option and reads its output from there) with the additional `--` comment at the end of each line to separate the comment from the executed command.
8. The `$HOME/Documents/eBooks` directory is changed to `/opt`, which allows us to perform the Git clone operation in that directory instead of in the user's home directory (`~/Documents/eBooks`). This will ensure that we have a clean repository after the script's execution.
9. The rest of the script continues as before.
