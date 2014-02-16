#!/bin/bash
 
# turn on logging for your red matrix site
# by tony baldwin | https://tonybaldwin.info
# released according to GPL v.3 or later
 
if [[ $(whoami) != root ]] ; then
echo "You must be root to run this script, bitch!"
exit
fi
 
read -p "Is $(pwd) the path to your red installation? (y/n)" ispath
if [[ $ispath = n ]]; then
read -p "Please enter the path to you red installation: (i.e. /var/www/red, leave off trailing slash)" rpath
else
rpath=$(pwd)
fi
 
echo "creating log directory and logs"
mkdir $rpath/log
touch $rpath/log/red.log
touch $rpath/log/reddb.log
touch $rpath/log/php.log
 
chown www-data:www-data $rpath/log/*.log
 
echo "configuring logs ..."
 
echo "// added for php logging stuff
 
error_reporting(E_ERROR | E_WARNING | E_PARSE );
ini_set('error_log','$rpath/log/php.log');
ini_set('log_errors','1');
ini_set('display_errors', '0');
\$a->config['system']['db_log'] = \"$rpath/log/reddb.log\";
\$a->config['system']['db_loglimit'] = 0.5;" >> $rpath/.htconfig.php
 
echo "configuring log rotation ... "
 
echo "$rpath/log/*.log {
daily
rotate 2
compress
notifempty
create 664 www-data www-data
postrotate
endscript
maxage 5
}" > /etc/logrotate.d/red
 
echo "The path to your red log, to be entered into the field at yoursite/admin/logs is $rpath/log/red.log"
 
exit
