echo "------------------------------------------------------------------------------
				Loading Data
------------------------------------------------------------------------------"

./bin/linkbench -c config/MyConfig.properties -csvstats load-phase-final-stats.csv -csvstream load-phase-streaming-stats.csv -L load-phase.log -l
