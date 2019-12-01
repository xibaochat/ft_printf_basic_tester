#!/bin/bash

SH_SRCS=./srcs_tester/

source $SH_SRCS/config.sh

compile_test() {
	gcc $TMP_DIR/printf_tester.c $LIBRARY -o printf
	gcc $TMP_DIR/ft_printf_tester.c $LIBRARY -I . -o ft_printf
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
		echo -e "${GREEN}OK${NC}"
	else
		echo -e "${RED}FAIL${NC}"
		echo "$@" >> $FAILED_TESTS

	fi
}

clean() {
	rm -rf $TMP_DIR
	rm -f printf ft_printf
}
