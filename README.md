# LinkBench-workload

These instructions assume you are using a UNIX-like system such as a Linux distribution or Mac OS X.

## Prerequisites

LinkBench requires some necessary softwares. To obtain them, run this command line:
~~~
bash prerequisites.sh
~~~

## Getting and Building LinkBench

To get the source code and build LinkBench, run this command line:
~~~
bash linkbench.sh
~~~

##  MySQL setup

To setup LinkBench to run with MySQL database, run this command line:
~~~
bash databasesetup.sh
~~~
NOTE: linkdb.sql must be on the same dicrectory as this script.

## Running a Benchmark

### Loading Data

To do an initial load of data, inside of LinkBench directory, use the command line:
~~~
bash loadphase.sh
~~~

### Request phase

Run the request phase, inside of LinkBench directory, using the below command:
~~~
bash requestphase.sh
~~~
