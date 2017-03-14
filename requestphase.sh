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
# parameters

# -csvstats request-phase-final-stats.csv 
	#provide a csv file with final stats
# -csvstream request-phase-streaming-stats.csv
	#provide a csv file with streaming stats
# -L request-phase.log 
	#output is sent to a file log
# -D debuglevel=DEBUG
	#more detailed logging
	
./bin/linkbench -c config/MyConfig.properties -csvstats request-phase-final-stats.csv -csvstream request-phase-streaming-stats.csv -r

cd $MY_PATH
