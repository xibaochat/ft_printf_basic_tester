#!/bin/bash

##########
# NUMBERS
basic_width_with_precision_number_tests_template() {
	# PRECISION = 0
	FORMAT="\"%$1.0d\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.0i\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.0u\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.0x\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.0X\","
	launch_test $FORMAT $2

	# PRECISION = 1
	FORMAT="\"%$1.1d\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.1i\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.1u\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.1x\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.1X\","
	launch_test $FORMAT $2

	# PRECISION = 5
	FORMAT="\"%$1.5d\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.5i\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.5u\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.5x\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.5X\","
	launch_test $FORMAT $2

	# PRECISION = 10
	FORMAT="\"%$1.10d\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.10i\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.10u\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.10x\","
	launch_test $FORMAT $2
	FORMAT="\"%$1.10X\","
	launch_test $FORMAT $2
}

basic_width_with_precision_numbers_launcher() {
	echo -e "[+] Testing with number: ${YELLOW}$1"
	basic_width_with_precision_number_tests_template 0 $1
	basic_width_with_precision_number_tests_template 1 $1
	basic_width_with_precision_number_tests_template 2 $1
	basic_width_with_precision_number_tests_template 5 $1
	basic_width_with_precision_number_tests_template 10 $1
	basic_width_with_precision_number_tests_template 20 $1
	basic_width_with_precision_number_tests_template 100 $1
}

basic_precision_number_tests() {
	sub_test_banner "Numbers"
	basic_width_with_precision_numbers_launcher 0
	basic_width_with_precision_numbers_launcher 42
	basic_width_with_precision_numbers_launcher 2147483647
	basic_width_with_precision_numbers_launcher 2147483648
	basic_width_with_precision_numbers_launcher -2147483647
	basic_width_with_precision_numbers_launcher -2147483648
	basic_width_with_precision_numbers_launcher -42
	basic_width_with_precision_numbers_launcher -42
}


################
# MAIN FUNCTION

width_with_precision_tests() {
	basic_precision_number_tests
}
