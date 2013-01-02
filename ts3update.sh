#!/bin/bash
PKGURL='http://teamspeak.gameserver.gamed.de/ts3/releases/3.0.6.1/teamspeak3-server_linux-amd64-3.0.6.1.tar.gz'
PKGNAME=$(basename $PKGURL)
clear
echo Did you STOP and BACKUP the TeamSpeak3 Server\?
read -p "Press [ENTER] to continue updating"
clear
echo '################'
echo Downloading...
wget --quiet $PKGURL
echo Finished...
echo '################'
echo Unpacking...
tar -zxf $PKGNAME
echo Finished...
echo '################'
echo Moving Files...
mv ./teamspeak3-server_linux-amd64/doc/* ./doc/ > /dev/null
mv ./teamspeak3-server_linux-amd64/serverquerydocs/* ./serverquerydocs/ > /dev/null
mv ./teamspeak3-server_linux-amd64/sql/create_mysql* ./sql/create_mysql/ > /dev/null
mv ./teamspeak3-server_linux-amd64/sql/create_sqlite/* ./sql/create_sqlite/ > /dev/null
mv ./teamspeak3-server_linux-amd64/sql/* ./sql/ > /dev/null
mv ./teamspeak3-server_linux-amd64/* ./ > /dev/null
echo Finished...
echo '################'
echo Cleaning Up...
rm -fr teamspeak3-server_linux-amd64
rm -f $PKGNAME
rm -f update.sh
echo Finished...
echo '################'
echo Add inifile=ts3server.ini to ts3server_startscript.sh
read -p "Press [ENTER] to continue to the editor"
vi ts3server_startscript.sh
echo Finished...
echo '################'
echo Update Complete\!
