
echo "Injecting /var/log/commands.log shell one liner into .bashrc with printf..."; sleep 1
printf '

#####################################################################

# LOG ALL COMMANDS TO /VAR/LOG/COMMANDS.LOG VIA RSYSLOG

#whoami="$(whoami)@$(echo $SSH_CONNECTION | awk '{print $1}')"
#export PROMPT_COMMAND='RETRN_VAL=$?;logger -p local6.debug "$whoami [$$]: $(history 1 | sed "s/^[ ]*[0-9]\+[ ]*//" ) [$RETRN_VAL]"'

#####################################################################


' | tee -a ~/.bashrc

printf 'Adding new syslog rule for reporting to log /var/log/commands.log';
echo 'local6.*    /var/log/commands.log' | tee -a /etc/rsyslog.d/bash.conf


sudo service rsyslog restart


echo 'adding log to logrotate and restarting rsyslog service daemon'


sudo -e /etc/bashrc

export PROMPT_COMMAND='RETRN_VAL=$?;logger -p local6.debug "$(whoami) [$$]: $(history 1 | sed "s/^[ ]*[0-9]\+[ ]*//" )"'

source /etc/bashrc

sudo -e /etc/rsyslog.d/bash.conf

local6.*    /var/log/commands.log

sudo -e /etc/logrotate.d/syslog

/var/log/commands.log

sudo service rsyslog restart 
