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

create_srcs_files() {
	rm -rf $TMP_DIR
	mkdir -p $TMP_DIR

	echo -en '#include <stdio.h>\nint main(void){printf(' > $TMP_DIR/printf_tester.c
	echo -n $@ >> $TMP_DIR/printf_tester.c
	echo ');return (0);}' >> $TMP_DIR/printf_tester.c

	echo -en '#include <' > $TMP_DIR/ft_printf_tester.c
	echo -n $HEADER_FILE >> $TMP_DIR/ft_printf_tester.c
	echo -en '>\nint main(void){printf(' >> $TMP_DIR/ft_printf_tester.c
	echo -n $@ >> $TMP_DIR/ft_printf_tester.c
	echo ');return (0);}' >> $TMP_DIR/ft_printf_tester.c
}

compile_test() {
	gcc $LIBRARY $TMP_DIR/printf_tester.c -o printf
	gcc $LIBRARY $TMP_DIR/ft_printf_tester.c -I . -o ft_printf
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

clean() {
	rm -rf $TMP_DIR
	rm -f printf ft_printf
}

launch_test() {
	create_srcs_files $@
	compile_test
	execute_binaries
	diff_outputs $@
	clean
}

basic_tests() {
	launch_test '"%s", "boid"'
	launch_test '"%s", ""'
	launch_test '"%s", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
	launch_test '"%s", NULL'

	launch_test '"%d", 42'
	launch_test '"%i", 42'
	launch_test '"%u", 42'
	launch_test '"%x", 42'
	launch_test '"%X", 42'
	launch_test '"%p", 42'

	launch_test '"%d", 0'
	launch_test '"%i", 0'
	launch_test '"%u", 0'
	launch_test '"%x", 0'
	launch_test '"%X", 0'
	launch_test '"%p", 0'


	launch_test '"%d", 2147483647'
	launch_test '"%i", 2147483647'
	launch_test '"%u", 2147483647'
	launch_test '"%x", 2147483647'
	launch_test '"%X", 2147483647'
	launch_test '"%p", 2147483647'


	launch_test '"%d", 2147483648'
	launch_test '"%i", 2147483648'
	launch_test '"%u", 2147483648'
	launch_test '"%x", 2147483648'
	launch_test '"%X", 2147483648'
	launch_test '"%p", 2147483648'


}

basic_tests
