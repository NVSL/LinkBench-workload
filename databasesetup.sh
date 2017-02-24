#!/bin/bash
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"

echo "------------------------------------------------------------------------------
				MySQL Setup
------------------------------------------------------------------------------

mysql -u root -p"
mysql -u root -p < linkdb.sql

echo "------------------------------------------------------------------------------
				Configuration Files
------------------------------------------------------------------------------

Current directory: $MY_PATH

Is linkbench-master folder on the current directory? [Y/n] "
read answer
if [ "$answer" == "N" ] || [ "$answer" == "n" ]; then
	echo "Type the path to the directory where linkbench-master folder is: "
	read path
	path=$path/linkbench-master
else
	path=linkbench-master
fi

cd $path

cat config/LinkConfigMysql.properties | sed 's/yourhostname.here/localhost/' | sed 's/MySQLuser/linkbench/' | sed 's/MySQLpass/linkbench/' > config/MyConfig.properties

echo "------------------------------------------------------------------------------
				Loading Data
------------------------------------------------------------------------------"

./bin/linkbench -c config/MyConfig.properties -csvstats load-phase-final-stats.csv -csvstream load-phase-streaming-stats.csv -L load-phase.log -l


echo "------------------------------------------------------------------------------
				Request Phase
------------------------------------------------------------------------------"

./bin/linkbench -c config/MyConfig.properties -csvstats request-phase-final-stats.csv -csvstream request-phase-streaming-stats.csv -L request-phase.log -r

cd $MY_PATH
