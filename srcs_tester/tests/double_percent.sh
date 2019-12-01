#!/bin/bash

##########
# STRINGS
double_percent_string_tests() {
	sub_test_banner "Strings"
	launch_test '"%%s", "boid"'
	launch_test '"%%s", ""'
	launch_test '"%%s", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
	launch_test '"%%s", NULL'
}

###########
# POINTERS
double_percent_ptr_tests() {
	sub_test_banner "Pointers"
	launch_test '"%%p",' 0
	launch_test '"%%p",' 42
	launch_test '"%%p", NULL'
}

########
# CHARS
double_percent_char_tests() {
	sub_test_banner "Chars"
	launch_char_test '"%%c"' 'k'
	launch_char_test '"%%c"' 'x'
	launch_char_test '"%%c"' '!'
	launch_char_test '"%%c"' '2'
	launch_char_test '"%%c"' '4'
	launch_char_test '"%%c"' '?'
}

##########
# NUMBERS
double_percent_number_tests_template() {
	launch_test '"%%d",' $1
	launch_test '"%%i",' $1
	launch_test '"%%u",' $1
	launch_test '"%%x",' $1
	launch_test '"%%X",' $1
}

double_percent_number_tests() {
	sub_test_banner "Numbers"
	double_percent_number_tests_template 0
	double_percent_number_tests_template 42
	double_percent_number_tests_template 2147483647
	double_percent_number_tests_template 2147483648
	double_percent_number_tests_template -2147483647
	double_percent_number_tests_template -2147483648
	double_percent_number_tests_template -42
	double_percent_number_tests_template -42
}

##################
# MULTIPLE FORMAT
double_percent_multiple_format_tests() {
	sub_test_banner "Multiple format"
	launch_test '"xiao kitten %%d di mao",' 42
	launch_test '"xiao kitten %%i di mao",' 42
	launch_test '"xiao kitten %%u di mao",' 42
	launch_test '"xiao kitten %%x di mao",' 42
	launch_test '"xiao kitten %%X di mao",' 42
	launch_test '"xiao kitten %%p di mao",' 42
	launch_test '"xiao kitten %%s di mao", "boid"'
	launch_test '"xiao kitten %%s di mao", ""'
	launch_test '"xiao kitten %%s di mao", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
	launch_test '"xiao kitten %%s di mao", NULL'

}

############
# MAIN FUNC
double_percent_tests() {
	test_banner "DOUBLE_PERCENTS"

	double_percent_char_tests
	double_percent_string_tests
#	double_percent_ptr_tests
	double_percent_number_tests
	double_percent_multiple_format_tests
}
