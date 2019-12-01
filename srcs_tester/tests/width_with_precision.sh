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

basic_width_with_precision_number_tests() {
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

# -------------------------------------------------------------

########
# CHARS
basic_width_with_precision_tests_char_template() {
	# PRECISION = 0
	FORMAT="\"%$1.0c\""
	launch_char_test $FORMAT $2

	# PRECISION = 1
	FORMAT="\"%$1.1c\""
	launch_char_test $FORMAT $2

	# PRECISION = 5
	FORMAT="\"%$1.5c\""
	launch_char_test $FORMAT $2

	# PRECISION = 10
	FORMAT="\"%$1.10c\""
	launch_char_test $FORMAT $2
}

basic_width_with_precision_char_launcher() {
	echo -e "[+] Testing with value: ${YELLOW}$1"
	basic_width_with_precision_tests_char_template 0 $1
	basic_width_with_precision_tests_char_template 1 $1
	basic_width_with_precision_tests_char_template 2 $1
	basic_width_with_precision_tests_char_template 5 $1
	basic_width_with_precision_tests_char_template 10 $1
	basic_width_with_precision_tests_char_template 20 $1
	basic_width_with_precision_tests_char_template 100 $1
}

basic_width_with_precision_char_tests() {
	basic_width_with_precision_char_launcher $1 '0'
	basic_width_with_precision_char_launcher $1 'x'
	basic_width_with_precision_char_launcher $1 '!'
}

# -------------------------------------------------------------

#########
# COMMON

basic_width_with_precision_tests_template() {
	# PRECISION = 0
	FORMAT="\"%$1.0$2\","
	launch_test $FORMAT $3

	# PRECISION = 1
	FORMAT="\"%$1.1$2\","
	launch_test $FORMAT $3

	# PRECISION = 5
	FORMAT="\"%$1.5$2\","
	launch_test $FORMAT $3

	# PRECISION = 10
	FORMAT="\"%$1.10$2\","
	launch_test $FORMAT $3
}

basic_width_with_precision_launcher() {
	echo -e "[+] Testing with value: ${YELLOW}$2"
	basic_width_with_precision_tests_template 0 $1 $2
	basic_width_with_precision_tests_template 1 $1 $2
	basic_width_with_precision_tests_template 2 $1 $2
	basic_width_with_precision_tests_template 5 $1 $2
	basic_width_with_precision_tests_template 10 $1 $2
	basic_width_with_precision_tests_template 20 $1 $2
	basic_width_with_precision_tests_template 100 $1 $2
}

basic_width_with_precision_tests() {
	basic_width_with_precision_launcher $1 0
	basic_width_with_precision_launcher $1 42
	basic_width_with_precision_launcher $1 2147483647
	basic_width_with_precision_launcher $1 2147483648
	basic_width_with_precision_launcher $1 -2147483647
	basic_width_with_precision_launcher $1 -2147483648
	basic_width_with_precision_launcher $1 -42
}

# -------------------------------------------------------------

##########
# STRINGS
basic_width_with_precision_str_tests() {
	sub_test_banner "Strings"
	basic_width_with_precision_launcher "s" '"boid"'
	basic_width_with_precision_launcher "s" '""'
	basic_width_with_precision_launcher "s" '"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
#	basic_width_with_precision_launcher "s" 'NULL'
}

###########
# POINTEUR
basic_width_with_precision_ptr_tests() {
	sub_test_banner "Pointeur"
	basic_width_with_precision_launcher "p" 0
	basic_width_with_precision_launcher "p" 42
	basic_width_with_precision_launcher "p" 'NULL'
}

################
# MAIN FUNCTION

width_with_precision_tests() {
    test_banner "WIDTH && PRECISION"

	basic_width_with_precision_number_tests
	basic_width_with_precision_str_tests
#	basic_width_with_precision_ptr_tests
	basic_width_with_precision_char_tests
}
