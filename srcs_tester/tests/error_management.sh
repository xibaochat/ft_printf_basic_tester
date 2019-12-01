#!/bin/bash

#########
# COMMON
error_management_launcher() {
	FORMAT='"%.5-10$1"',
	launch_test $FORMAT $2

	FORMAT='"%**.*$1"',
	launch_test $FORMAT 42, $2

	FORMAT='"%**$1"',
	launch_test $FORMAT 42, $2

	FORMAT='"%.**$1"',
	launch_test $FORMAT 42, $2

	FORMAT='"%*.10*$1"',
	launch_test $FORMAT 42, $2

	FORMAT='"%*10.*$1"',
	launch_test $FORMAT 42, $2
}


multi_error_management_launcher() {
	FORMAT='"$1 %.5-10$2"',
	launch_test $FORMAT $3

	FORMAT='"$1 %**.*$2"',
	launch_test $FORMAT 42, $3

	FORMAT='"$1 %**$2"',
	launch_test $FORMAT 42, $3

	FORMAT='"$1 %.**$2"',
	launch_test $FORMAT 42, $3

	FORMAT='"$1 %*.10*$2"',
	launch_test $FORMAT 42, $3

	FORMAT='"$1 %*10.*$2"',
	launch_test $FORMAT 42, $3
}


##########
# STRINGS
error_management_string_tests() {
	sub_test_banner "Strings"
	error_management_launcher 's' '"boid"'
	error_management_launcher 's' '""'
	error_management_launcher 's' '"xxxxxxxxxxxxxxxxxxxxxxx"'
	error_management_launcher 's' 'NULL'
}

###########
# POINTERS
error_management_ptr_tests() {
	sub_test_banner "Pointers"
	error_management_launcher 'p' 0
	error_management_launcher 'p' 42
	error_management_launcher 'p' 'NULL'
}

########
# CHARS
error_management_char_tests() {
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
error_management_number_tests_template() {
	error_management_launcher '"%d",' $1
	error_management_launcher '"%i",' $1
	error_management_launcher '"%u",' $1
	error_management_launcher '"%x",' $1
	error_management_launcher '"%X",' $1
}

error_management_number_tests() {
	sub_test_banner "Numbers"
	error_management_number_tests_template 0
	error_management_number_tests_template 42
	error_management_number_tests_template 2147483647
	error_management_number_tests_template 2147483648
	error_management_number_tests_template -2147483647
	error_management_number_tests_template -2147483648
	error_management_number_tests_template -42
	error_management_number_tests_template -42
}

##################
# MULTIPLE FORMAT
error_management_multiple_format_tests() {
	sub_test_banner "Multiple format"
	multi_error_management_launcher "xiao kitten" "d di mao" 42
	multi_error_management_launcher "xiao kitten" "i di mao" 42
	multi_error_management_launcher "xiao kitten" "u di mao" 42
	multi_error_management_launcher "xiao kitten" "x di mao" 42
	multi_error_management_launcher "xiao kitten" "X di mao" 42
	multi_error_management_launcher "xiao kitten" "p di mao" 42
	multi_error_management_launcher "xiao kitten" "s di mao" '"boid"'
	multi_error_management_launcher "xiao kitten" "s di mao" '""'
	multi_error_management_launcher "xiao kitten" "s di mao" '"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
	multi_error_management_launcher "xiao kitten" "s di mao" 'NULL'

}

############
# MAIN FUNC
error_management_tests() {
	test_banner "ERROR_MANAGEMENTS"

	error_management_string_tests
	error_management_ptr_tests
	error_management_number_tests
	error_management_multiple_format_tests
}
