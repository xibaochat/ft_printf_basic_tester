#!/bin/bash

SH_SRCS=./srcs_tester/

source $SH_SRCS/config.sh

######################
# REQUIREMENTS TESTS #
######################

if [[ ! -f $LIBRARY ]]
then
	echo -e "[-] ${RED}Missing library file: $LIBRARY"
	exit
fi

if [[ ! -f "$HEADER_FILE" ]]
then
	echo -e "[-] ${RED}Missing header file: $HEADER_FILE"
	exit
fi
