#!/bin/bash

SH_SRCS=./srcs_tester/

source $SH_SRCS/config.sh

launch_test() {
	create_srcs_files $@
	compile_test
	execute_binaries
	diff_outputs $@
	clean
}

launch_char_test() {
	create_char_srcs_files $@
	compile_test
	execute_binaries
	diff_outputs $@
	clean
}

launch_char_one_star_test() {
	create_char_one_star_srcs_files $@
	compile_test
	execute_binaries
	diff_outputs $@
	clean
}

launch_char_double_star_test() {
	create_char_double_star_srcs_files $@
	compile_test
	execute_binaries
	diff_outputs $@
	clean
}
