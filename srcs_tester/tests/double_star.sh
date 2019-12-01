#!/bin/bash

##########
# COMMON
double_star_tests_template() {
	FORMAT="\"%*.*$1\", $2, $3, $4"
	launch_test $FORMAT
}

double_star_launch_tests_bis() {
	double_star_tests_template $1 0 $2 $3
	double_star_tests_template $1 1 $2 $3
	double_star_tests_template $1 2 $2 $3
	double_star_tests_template $1 5 $2 $3
	double_star_tests_template $1 10 $2 $3
	double_star_tests_template $1 20 $2 $3
	double_star_tests_template $1 100 $2 $3
	double_star_tests_template $1 -10 $2 $3
	double_star_tests_template $1 -20 $2 $3
	double_star_tests_template $1 -100 $2 $3
}

double_star_launch_tests() {
	double_star_launch_tests_bis $1 0 $2
	double_star_launch_tests_bis $1 1 $2
	double_star_launch_tests_bis $1 2 $2
	double_star_launch_tests_bis $1 5 $2
	double_star_launch_tests_bis $1 10 $2
	double_star_launch_tests_bis $1 20 $2
	double_star_launch_tests_bis $1 100 $2
	double_star_launch_tests_bis $1 -10 $2
	double_star_launch_tests_bis $1 -20 $2
	double_star_launch_tests_bis $1 -100 $2
}

##########
# STRINGS
double_star_string_tests() {
	sub_test_banner "Strings"
	double_star_launch_tests 's' '"boid"'
	double_star_launch_tests 's' '""'
	double_star_launch_tests 's' '"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
	double_star_launch_tests 's' 'NULL'
}

###########
# POINTERS
double_star_ptr_tests() {
	sub_test_banner "Pointers"
	double_star_launch_tests 'p' 0
	double_star_launch_tests 'p' 42
	double_star_launch_tests 'p' 'NULL'
}

##########
# NUMBERS
double_star_number_tests_template() {
	double_star_launch_tests 'd' $1
	double_star_launch_tests 'i' $1
	double_star_launch_tests 'u' $1
	double_star_launch_tests 'x' $1
	double_star_launch_tests 'X' $1
}

double_star_number_tests() {
	sub_test_banner "Numbers"
	double_star_number_tests_template 0
	double_star_number_tests_template 42
	double_star_number_tests_template 2147483647
	double_star_number_tests_template 2147483648
	double_star_number_tests_template -2147483647
	double_star_number_tests_template -2147483648
	double_star_number_tests_template -42
}

########
# CHARS
double_star_char_tests_template() {
	launch_char_double_star_test "\"%*.*c\"" $1 $2 'c'
}

double_star_char_launch_tests_bis() {
	double_star_char_tests_template 0 $1
	double_star_char_tests_template 1 $1
	double_star_char_tests_template 2 $1
	double_star_char_tests_template 5 $1
	double_star_char_tests_template 10 $1
	double_star_char_tests_template 20 $1
	double_star_char_tests_template 100 $1
	double_star_char_tests_template -10 $1
	double_star_char_tests_template -20 $1
	double_star_char_tests_template -100 $1
}

double_star_char_launch_tests() {
	sub_test_banner "Chars"
	double_star_char_launch_tests_bis 0
	double_star_char_launch_tests_bis 1
	double_star_char_launch_tests_bis 2
	double_star_char_launch_tests_bis 5
	double_star_char_launch_tests_bis 10
	double_star_char_launch_tests_bis 20
	double_star_char_launch_tests_bis 100
	double_star_char_launch_tests_bis -10
	double_star_char_launch_tests_bis -20
	double_star_char_launch_tests_bis -100
}

############
# MAIN FUNC
double_star_tests() {
	test_banner "DOUBLE STAR"

	double_star_string_tests
	double_star_ptr_tests
	double_star_number_tests
	double_star_char_launch_tests
}
