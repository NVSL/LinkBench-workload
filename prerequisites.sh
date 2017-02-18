#!/bin/bash
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"
echo "Do you want to install Java? [Y/n] "
read answer
if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
	sudo apt-get install default-jdk
fi

echo "-------------------------------------------------------------------------------
Do you want to install MySQL? [Y/n] "
read answer
if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
	sudo apt-get install mysql-server
fi

echo "-------------------------------------------------------------------------------
Do you want to install Apache-Maven ? [Y/n] "
read answer
if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
	sudo apt-get install maven
fi

echo "-------------------------------------------------------------------------------
Do you want to install Connector-J? [Y/n] "
read answer
if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
	echo "-------------------------------------------------------------------------------
Downloading Connector-J to $MY_PATH
Do you want to change the directory? [Y/n] "
	read answer
	if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
		echo "Type the path to the directory you want to download Connector-J to: "
		read path
	else
		path=$MY_PATH
	fi
	wget -P $path http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.zip
	unzip $path/mysql-connector-java-5.1.40.zip -d $path/mysql-connector-java-5.1.40
	export CLASSPATH=$path/mysql-connector-java-5.1.40/mysql-connector-java-5.1.40.jar:$CLASSPATH
fi
