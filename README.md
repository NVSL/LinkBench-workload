# LinkBench-workload

These instructions assume you are using a UNIX-like system such as a Linux distribution or Mac OS X.

## Prerequisites

LinkBench requires some necessary softwares. To obtain them, run this command line:
~~~
. ./prerequisites.sh
~~~

## Getting and Building LinkBench

To get the source code and build LinkBench, run this command line:
~~~
. ./linkbench.sh
~~~

##  MySQL setup

To setup LinkBench to run with MySQL database, run this command line:
~~~
. ./databasesetup.sh
~~~
NOTE: linkdb.sql must be on the same dicrectory as this script.

## Running a Benchmark

### Loading Data

To do an initial load of data use the command line:
~~~
. ./loadphase.sh
~~~

### Request phase

Run the request phase using the below command:
~~~
. ./requestphase.sh
~~~
