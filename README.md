redlogger
=========

bash script to set up logs for a redmatrix installation
by tony baldwin | https://tonybaldwin.info

redmatrix site admins, copy this script to /usr/local/bin/redlogger.sh
or, even better, /usr/sbin/redlogger.sh
and just run it.
It will ask for the path to your redmatrix installation.
It will then create a directory $baseReddirectory/log/ and populate it
with logs for logging red, reddb, and php stuff.
It will assign appropriate permissions and ownership to the logs.
It will create entries in /etc/logrotate.d/ for rotation of these logs.

You can always edit the logrotate entries by hand if you'd
prefer different configuration.

This was written and tested on debian gnu/linux servers,
both squeeze and wheezy.


