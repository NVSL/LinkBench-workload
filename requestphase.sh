echo "------------------------------------------------------------------------------
				Request Phase
------------------------------------------------------------------------------"

./bin/linkbench -c config/MyConfig.properties -csvstats request-phase-final-stats.csv -csvstream request-phase-streaming-stats.csv -L request-phase.log -r
