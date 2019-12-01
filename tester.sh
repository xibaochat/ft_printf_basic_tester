#!/bin/bash

SH_SRCS=./srcs_tester/

source $SH_SRCS/colors.sh
source $SH_SRCS/tester_funcs.sh
source $SH_SRCS/requirements_test.sh

basic_tests() {
	launch_test '"%s", "boid"'
	launch_test '"%s", ""'
	launch_test '"%s", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
	launch_test '"%s", NULL'

	launch_test '"%d", 42'
	launch_test '"%i", 42'
	launch_test '"%u", 42'
	launch_test '"%x", 42'
	launch_test '"%X", 42'
	launch_test '"%p", 42'

	launch_test '"%d", 0'
	launch_test '"%i", 0'
	launch_test '"%u", 0'
	launch_test '"%x", 0'
	launch_test '"%X", 0'
	launch_test '"%p", 0'


	launch_test '"%d", 2147483647'
	launch_test '"%i", 2147483647'
	launch_test '"%u", 2147483647'
	launch_test '"%x", 2147483647'
	launch_test '"%X", 2147483647'
	launch_test '"%p", 2147483647'


	launch_test '"%d", 2147483648'
	launch_test '"%i", 2147483648'
	launch_test '"%u", 2147483648'
	launch_test '"%x", 2147483648'
	launch_test '"%X", 2147483648'
	launch_test '"%p", 2147483648'


}

basic_tests
