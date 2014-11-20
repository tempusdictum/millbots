#!/bin/sh
PROGRAMD=/usr/local/programd-4.6-src/ProgramD
CLASSPATH=${PROGRAMD}/distrib/programd-main.jar
CLASSPATH=${CLASSPATH}:${PROGRAMD}/distrib/programd-rhino.jar
CLASSPATH=${CLASSPATH}:${PROGRAMD}/lib/gnu.getopt-1.0.10.jar
CLASSPATH=${CLASSPATH}:${PROGRAMD}/jetty/jetty/webapps/programd/WEB-INF/lib/log4j-1.2.13.jar
CLASSPATH=${CLASSPATH}:./lib/pircbot-1.5.0.jar
CLASSPATH=${CLASSPATH}:${PROGRAMD}/lib/mysql-connector-java-3.1.12-bin.jar

BLDPATH=build
SRCPATH=src/org/aitools/programd/listener

if [ ! -d ${BLDPATH} ]; then
    mkdir build
fi
javac -classpath ${CLASSPATH} -d ${BLDPATH} ${SRCPATH}/IRCListener.java ${SRCPATH}/ProgramDPircBot.java

