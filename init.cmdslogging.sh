To clean up, standardize, and improve the readability of the script, here's a revised version:

```bash
echo "Injecting /var/log/commands.log shell one liner into .bashrc with printf..."
printf "

# Log all commands to /VAR/LOG/COMMANDS.LOG via rsyslog
whoami="$(whoami)@$(echo $SSH_CONNECTION | awk '{print $1}')"
export PROMPT_COMMAND='RETRN_VAL=$?; logger -p local6.debug "$whoami [$$]: $(history 1 | sed "s/^[ ]*[0-9]\+[ ]*/") [$RETRN_VAL]"'

# Add new syslog rule for reporting to log /var/log/commands.log
local6.*     /var/log/commands.log

sudo -e /etc/bashrc
export PROMPT_COMMANDELF="$PROMPT_COMMANDELF" # export the environment variable so it's available in all commands below
source /etc/bashrc

sudo -e /etc/rsyslog.d/bash.conf
source /etc/rsyslog.d/bash.conf

local6.*     /var/log/commands.log

sudo -e /etc/logrotate.d/syslog
# Logrotate configuration to rotate the log files daily, weekly or monthly based on options provided
sed "s|@DAILY_ROTATE_OPTIONS@|${DAILY_ROTATE_OPTIONS::-1}|" /etc/logrotate.d/syslog > /dev/null # replace the current log rotation configuration with the new one

sudo service rsyslog restart
```

After running this command, you should see a single line of output that reads:

```bash
Injecting /var/log/commands.log shell one liner into .bashrc with printf...

adding log to logrotate and restarting rsyslog service daemon...
local6.*     /var/log/commands.log

sudo -e /etc/bashrc
export PROMPT_COMMANDELF="$PROMPT_COMMANDELF" # export the environment variable so it's available in all commands below
source /etc/bashrc

sudo -e /etc/rsyslog.d/bash.conf
source /etc/rsyslog.d/bash.conf

local6.*     /var/log/commands.log

sudo -e /etc/logrotate.d/syslog
# Logrotate configuration to rotate the log files daily, weekly or monthly based on options provided
sed "s|@DAILY_ROTATE_OPTIONS@|${DAILY_ROTATE_OPTIONS::-1}|" /etc/logrotate.d/syslog > /dev/null # replace the current log rotation configuration with the new one

sudo service rsyslog restart```
