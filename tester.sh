#!/bin/bash

source ./srcs_tester/colors.sh

######################
# REQUIREMENTS TESTS #
######################

LIBRARY=libftprintf.a
HEADER_FILE=libftprintf.h

if [[ ! -f $LIBRARY ]]
then
	echo -e "[-] ${RED}Missing library file: $LIBRARY"
	exit
fi

if [[ ! -f "$HEADER_FILE" ]]
then
	echo -e "[-] ${RED}Missing header file: $HEADER_FILE"
	exit
fi

#######################


TMP_DIR=./tmp/
SRCS_DIR=./srcs/

copy_source_files() {
	rm -rf $TMP_DIR
	mkdir -p $TMP_DIR
	rm -f $TMP_DIR/ft_printf_tester.c $TMP_DIR/printf_tester.c
	cp $SRCS_DIR/ft_printf_tester.c $TMP_DIR/
	cp $SRCS_DIR/printf_tester.c $TMP_DIR/
}

replace_in_srcs_template() {
	sed -i 's|TO_REPLACE|'"$@"'|g' $TMP_DIR/printf_tester.c
	sed -i 's|TO_REPLACE|'"$@"'|g' $TMP_DIR/ft_printf_tester.c
}

compile_test() {
	gcc $LIBRARY $TMP_DIR/printf_tester.c -o printf
	gcc $LIBRARY $TMP_DIR/ft_printf_tester.c -o ft_printf
}

execute_binaries() {
	./printf > $TMP_DIR/printf.log
	./ft_printf > $TMP_DIR/ft_printf.log
}

diff_outputs() {
	echo -en "${BLUE}$@:\t${NC}"
	diff $TMP_DIR/printf.log $TMP_DIR/ft_printf.log >/dev/null
	if [[ $? -eq 0 ]]
	then
		echo -e "${GREEN}OK"
	else
		echo -e "${RED}FAIL"
	fi
}

launch_test() {
	copy_source_files
#	replace_in_srcs_template $@
#	compile_test
#	execute_binaries
#	diff_outputs $@
}

launch_test '"%s", "boid"'

#rm -r $TMP_DIR
