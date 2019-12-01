#!/bin/bash

##########
# NUMBERS
basic_width_number_tests_template() {
	launch_test '"%0d",' $1
	launch_test '"%0i",' $1
	launch_test '"%0u",' $1
	launch_test '"%0x",' $1
	launch_test '"%0X",' $1

	launch_test '"%1d",' $1
	launch_test '"%1i",' $1
	launch_test '"%1u",' $1
	launch_test '"%1x",' $1
	launch_test '"%1X",' $1

	launch_test '"%2d",' $1
	launch_test '"%2i",' $1
	launch_test '"%2u",' $1
	launch_test '"%2x",' $1
	launch_test '"%2X",' $1

	launch_test '"%10d",' $1
	launch_test '"%10i",' $1
	launch_test '"%10u",' $1
	launch_test '"%10x",' $1
	launch_test '"%10X",' $1

	launch_test '"%100d",' $1
	launch_test '"%100i",' $1
	launch_test '"%100u",' $1
	launch_test '"%100x",' $1
	launch_test '"%100X",' $1
}

basic_width_number_tests() {
	sub_test_banner "Numbers"
	basic_width_number_tests_template 0
	basic_width_number_tests_template 42
	basic_width_number_tests_template 2147483647
	basic_width_number_tests_template 2147483648
	basic_width_number_tests_template -2147483647
	basic_width_number_tests_template -2147483648
	basic_width_number_tests_template -42
	basic_width_number_tests_template -42
}

##########
# STRINGS
basic_width_string_tests_template() {
	launch_test '"0%s",' $1
	launch_test '"1%s",' $1
	launch_test '"2%s",' $1
	launch_test '"5%s",' $1
	launch_test '"10%s",' $1
	launch_test '"20%s",' $1
	launch_test '"100%s",' $1
}

basic_width_string_tests() {
	sub_test_banner '"Strings"'
	basic_width_string_tests_template '"boid"'
	basic_width_string_tests_template '""'
	basic_width_string_tests_template '"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
	basic_width_string_tests_template '"NULL"'
}

########
# CHARS
basic_width_char_tests_template() {
	launch_char_test '"%0c"' $1
	launch_char_test '"%1c"' $1
	launch_char_test '"%2c"' $1
	launch_char_test '"%5c"' $1
	launch_char_test '"%10c"' $1
	launch_char_test '"%20c"' $1
}

basic_width_char_tests() {
	sub_test_banner "Chars"
	basic_width_char_tests_template 'k'
	basic_width_char_tests_template 'x'
	basic_width_char_tests_template '!'
	basic_width_char_tests_template '2'
	basic_width_char_tests_template '4'
	basic_width_char_tests_template '?'
}

############
# MAIN FUNC
basic_width_tests() {
	test_banner "BASICS WIDTH"

	basic_width_number_tests
	basic_width_string_tests
	basic_width_char_tests
}
