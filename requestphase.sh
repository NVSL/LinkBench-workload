#!/bin/bash

MY_PATH="`( cd \"$MY_PATH\" && pwd )`"

echo "------------------------------------------------------------------------------
				Request Phase
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

./bin/linkbench -c config/MyConfig.properties -csvstats request-phase-final-stats.csv -csvstream request-phase-streaming-stats.csv -L request-phase.log -r

cd $MY_PATH
