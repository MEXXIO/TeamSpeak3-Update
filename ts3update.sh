#!/bin/bash
#BEGIN CONFIG
TSVER="3.0.7.1" # Version upgrading to. Stable releases only.
TSBIT="amd64" # x86 or amd64
#END CONFIG
PKGURL="http://teamspeak.gameserver.gamed.de/ts3/releases/$TSVER/teamspeak3-server_linux-$TSBIT-$TSVER.tar.gz"
PKGNAME=$(basename $PKGURL)
clear
echo Did you STOP and BACKUP the TeamSpeak3 Server\?
read -p "Press [ENTER] to continue updating"
clear
echo Downloading...
wget --quiet $PKGURL
echo Unpacking...
tar -zxf $PKGNAME
echo Moving Files...
mv ./teamspeak3-server_linux-$TSBIT/doc/* ./doc/ 2> /dev/null
mv ./teamspeak3-server_linux-$TSBIT/serverquerydocs/* ./serverquerydocs/ 2> /dev/null
mv ./teamspeak3-server_linux-$TSBIT/sql/create_mysql* ./sql/create_mysql/ 2> /dev/null
mv ./teamspeak3-server_linux-$TSBIT/sql/create_sqlite/* ./sql/create_sqlite/ 2> /dev/null
mv ./teamspeak3-server_linux-$TSBIT/sql/* ./sql/ 2> /dev/null
mv ./teamspeak3-server_linux-$TSBIT/* ./ 2> /dev/null
echo Cleaning Up...
rm -fr teamspeak3-server_linux-$TSBIT
rm -f $PKGNAME
rm -f ts3update.sh
echo -n "Modify ts3server_startscript.sh [y/N]? (ex: inifile=ts3server.ini)"
read MODSCRIPT
case $MODSCRIPT in
[yY] | [yY][eE][sS] )
  vi ts3server_startscript.sh
;;
esac
echo Update Complete\!
