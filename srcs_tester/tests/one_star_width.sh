#!/bin/bash

##########
# COMMON
one_star_width_tests_template() {
	FORMAT="\"%*$1\", $2, $3"
	launch_test $FORMAT
}

one_star_width_launch_tests() {
	one_star_width_tests_template $1 0 $2
	one_star_width_tests_template $1 1 $2
	one_star_width_tests_template $1 2 $2
	one_star_width_tests_template $1 5 $2
	one_star_width_tests_template $1 10 $2
	one_star_width_tests_template $1 20 $2
	one_star_width_tests_template $1 100 $2
	one_star_width_tests_template $1 -10 $2
	one_star_width_tests_template $1 -20 $2
	one_star_width_tests_template $1 -100 $2
}


##########
# STRINGS
one_star_width_string_tests() {
	sub_test_banner "Strings"
	one_star_width_launch_tests 's' '"boid"'
	one_star_width_launch_tests 's' '""'
	one_star_width_launch_tests 's' '"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
	one_star_width_launch_tests 's' 'NULL'
}

###########
# POINTERS
one_star_width_ptr_tests() {
	sub_test_banner "Pointers"
	one_star_width_launch_tests 'p' 0
	one_star_width_launch_tests 'p' 42
	one_star_width_launch_tests 'p' 'NULL'
}

##########
# NUMBERS
one_star_width_number_tests_template() {
	one_star_width_launch_tests 'd' $1
	one_star_width_launch_tests 'i' $1
	one_star_width_launch_tests 'u' $1
	one_star_width_launch_tests 'x' $1
	one_star_width_launch_tests 'X' $1
}

one_star_width_number_tests() {
	sub_test_banner "Numbers"
	one_star_width_number_tests_template 0
	one_star_width_number_tests_template 42
	one_star_width_number_tests_template 2147483647
	one_star_width_number_tests_template 2147483648
	one_star_width_number_tests_template -2147483647
	one_star_width_number_tests_template -2147483648
	one_star_width_number_tests_template -42
	one_star_width_number_tests_template -42
}

########
# CHARS
one_star_char_tests_template() {
	launch_char_one_star_test "\"%*c\"" $1 'c'
}

one_star_char_launch_tests() {
	sub_test_banner "Chars"
	one_star_char_tests_template 0
	one_star_char_tests_template 1
	one_star_char_tests_template 2
	one_star_char_tests_template 5
	one_star_char_tests_template 10
	one_star_char_tests_template 20
	one_star_char_tests_template 100
	one_star_char_tests_template -10
	one_star_char_tests_template -20
	one_star_char_tests_template -100
}

############
# MAIN FUNC
one_star_width_tests() {
	test_banner "ONE STAR WIDTH"

	one_star_width_string_tests
#	one_star_width_ptr_tests
	one_star_width_number_tests
	one_star_char_launch_tests
}
