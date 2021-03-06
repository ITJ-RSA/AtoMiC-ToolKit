#!/bin/bash
echo
sleep 1

echo -e $YELLOW'--->Removing '$APPTITLE' Init.d Autostart scripts...'$ENDCOLOR

if [ -f /etc/init.d/$APPNAME ]; then
	sudo update-rc.d -f $APPNAME remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
	sudo rm /etc/init.d/$APPNAME || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }
	echo "/etc/init.d/$APPNAME init script removed"
else
	echo "/etc/init.d/$APPNAME init script not found"	
fi

#Remove the PID file and folder if it exists
if [ -d "/var/run/$APPNAME" ]; then
sudo rm -r /var/run/$APPNAME
fi

echo
echo -e $YELLOW'--->Removing '$APPTITLE' default Autostart scripts...'$ENDCOLOR
if [ -f /etc/default/$APPNAME ]; then
	sudo rm /etc/default/$APPNAME || { echo -e $RED'Warning! Removing default script failed.'$ENDCOLOR ; }
	echo "/etc/default/$APPNAME default script removed"
else
	echo "/etc/default/$APPNAME init script not found"	
fi
