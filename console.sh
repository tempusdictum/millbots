#!/bin/sh
PROGRAMD=/usr/local/programd-4.6-src/ProgramD
CLASSPATH=${PROGRAMD}/distrib/programd-main.jar
CLASSPATH=${CLASSPATH}:${PROGRAMD}/distrib/programd-rhino.jar
CLASSPATH=${CLASSPATH}:${PROGRAMD}/lib/gnu.getopt-1.0.10.jar
CLASSPATH=${CLASSPATH}:./lib/log4j-1.2.13.jar
CLASSPATH=${CLASSPATH}:./lib/pircbot-1.5.0.jar
#CLASSPATH=${CLASSPATH}:${PROGRAMD}/lib/mysql-connector-java-3.1.12-bin.jar
BLDPATH=./build
CLASSPATH=${CLASSPATH}:${BLDPATH}

if [ ! -d ${BLDPATH} ]; then
    echo "You might want to compile the IRCListener."
fi

MAIN=org.aitools.programd.configurations.SimpleConsole
CONFIG=./conf/core.xml

java -classpath ${CLASSPATH} ${MAIN}  -c ${CONFIG}
