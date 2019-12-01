#!/bin/bash

SH_CORE=./srcs_tester/core/
SH_TESTS=./srcs_tester/tests/

# SRCS CORE
source $SH_CORE/colors.sh
source $SH_CORE/requirements_test.sh
source $SH_CORE/srcs_creation.sh
source $SH_CORE/tester_funcs.sh
source $SH_CORE/test_launchers.sh
source $SH_CORE/tests_banner.sh


# SRCS TESTS
source $SH_TESTS/basics.sh
source $SH_TESTS/basic_width.sh
source $SH_TESTS/basic_precision.sh
source $SH_TESTS/width_with_precision.sh
source $SH_TESTS/one_star_width.sh
source $SH_TESTS/one_star_precision.sh
source $SH_TESTS/double_star.sh


#########
# Basics
#basic_tests
#basic_width_tests
#basic_precision_tests
#width_with_precision_tests
#one_star_width_tests
#one_star_precision_tests
double_star_tests
