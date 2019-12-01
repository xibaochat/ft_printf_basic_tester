#!/bin/bash

SH_SRCS=./srcs_tester/

source $SH_SRCS/config.sh

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

create_char_srcs_files() {
	rm -rf $TMP_DIR
	mkdir -p $TMP_DIR

	echo -en '#include <stdio.h>\nint main(void){printf(' > $TMP_DIR/printf_tester.c
	echo -n $1 >> $TMP_DIR/printf_tester.c
	echo -n ', ' >> $TMP_DIR/printf_tester.c
	echo -n "'" >> $TMP_DIR/printf_tester.c
	echo -n $2 >> $TMP_DIR/printf_tester.c
	echo -n "'" >> $TMP_DIR/printf_tester.c
	echo ');return (0);}' >> $TMP_DIR/printf_tester.c

	echo -en '#include <' > $TMP_DIR/ft_printf_tester.c
	echo -n $HEADER_FILE >> $TMP_DIR/ft_printf_tester.c
	echo -en '>\nint main(void){printf(' >> $TMP_DIR/ft_printf_tester.c
	echo -n $1 >> $TMP_DIR/ft_printf_tester.c
	echo -n ', ' >> $TMP_DIR/ft_printf_tester.c
	echo -n "'" >> $TMP_DIR/ft_printf_tester.c
	echo -n $2 >> $TMP_DIR/ft_printf_tester.c
	echo -n "'" >> $TMP_DIR/ft_printf_tester.c
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
		echo -e "${GREEN}OK${NC}"
	else
		echo -e "${RED}FAIL${NC}"
		echo "$@" >> $FAILED_TESTS
		exit
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

launch_char_test() {
	create_char_srcs_files $@
	compile_test
	execute_binaries
	diff_outputs $@
	clean
}
