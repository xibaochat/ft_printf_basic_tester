#!/bin/bash

##########
# STRINGS
basic_string_tests() {
	sub_test_banner "Strings"
	launch_test '"%s", "boid"'
	launch_test '"%s", ""'
	launch_test '"%s", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
	launch_test '"%s", NULL'
}

###########
# POINTERS
basic_ptr_tests() {
	sub_test_banner "Pointers"
	launch_test '"%p",' 0
	launch_test '"%p",' 42
	launch_test '"%p", NULL'
}

########
# CHARS
basic_char_tests() {
	sub_test_banner "Chars"
	launch_char_test '"%c"' 'k'
	launch_char_test '"%c"' 'x'
	launch_char_test '"%c"' '!'
	launch_char_test '"%c"' '2'
	launch_char_test '"%c"' '4'
	launch_char_test '"%c"' '?'
}

##########
# NUMBERS
basic_number_tests_template() {
	launch_test '"%d",' $1
	launch_test '"%i",' $1
	launch_test '"%u",' $1
	launch_test '"%x",' $1
	launch_test '"%X",' $1
}

basic_number_tests() {
	sub_test_banner "Numbers"
	basic_number_tests_template 0
	basic_number_tests_template 42
	basic_number_tests_template 2147483647
	basic_number_tests_template 2147483648
	basic_number_tests_template -2147483647
	basic_number_tests_template -2147483648
	basic_number_tests_template -42
	basic_number_tests_template -42
}

##################
# MULTIPLE FORMAT
basic_multiple_format_tests() {
	sub_test_banner "Multiple format"
}

############
# MAIN FUNC
basic_tests() {
	test_banner "BASICS"

	basic_char_tests
	basic_string_tests
	basic_ptr_tests
	basic_number_tests
}