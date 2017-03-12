#!/bin/bash

MY_PATH="`( cd \"$MY_PATH\" && pwd )`"

echo "Downloading LinkBench to $MY_PATH
Do you want to change the directory? [Y/n] "
read answer
if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
	echo "Type the path to the directory you want to download LinkBench to: "
	read path
else
	path=$MY_PATH
fi

wget -P $path wget https://github.com/facebookarchive/linkbench/archive/master.zip
unzip $path/master.zip -d $path

cd $path/linkbench-master

echo "------------------------------------------------------------------------------
				Building LinkBench
------------------------------------------------------------------------------
To skip slower tests (some run quite long), type [1]
To skip all tests, type [2]
To run all tests, type [3]"
read answer
if [ "$answer" == "1" ]; then
	mvn clean package -P fast-test
elif [ "$answer" == "2" ]; then
	mvn clean package -DskipTests
else
	mvn clean package
fi

echo "------------------------------------------------------------------------------
				Configuration Files
------------------------------------------------------------------------------"

cat config/LinkConfigMysql.properties | sed 's/yourhostname.here/localhost/' | sed 's/MySQLuser/linkbench/' | sed 's/MySQLpass/linkbench/' > config/MyConfig.properties

cd $MY_PATH
