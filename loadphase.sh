#!/bin/bash

MY_PATH="`( cd \"$MY_PATH\" && pwd )`"

echo "------------------------------------------------------------------------------
				Loading Data
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

./bin/linkbench -c config/MyConfig.properties -csvstats load-phase-final-stats.csv -csvstream load-phase-streaming-stats.csv -L load-phase.log -l

cd $MY_PATH
