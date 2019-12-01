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

create_char_one_star_srcs_files() {
	rm -rf $TMP_DIR
	mkdir -p $TMP_DIR

	echo -en '#include <stdio.h>\nint main(void){printf(' > $TMP_DIR/printf_tester.c
	echo -n $1 >> $TMP_DIR/printf_tester.c
	echo -n ', ' >> $TMP_DIR/printf_tester.c
	echo -n $2 >> $TMP_DIR/printf_tester.c
	echo -n ", '">> $TMP_DIR/printf_tester.c
	echo -n $3 >> $TMP_DIR/printf_tester.c
	echo -n "'" >> $TMP_DIR/printf_tester.c
	echo ');return (0);}' >> $TMP_DIR/printf_tester.c

	echo -en '#include <' > $TMP_DIR/ft_printf_tester.c
	echo -n $HEADER_FILE >> $TMP_DIR/ft_printf_tester.c
	echo -en '>\nint main(void){printf(' >> $TMP_DIR/ft_printf_tester.c
	echo -n $1 >> $TMP_DIR/ft_printf_tester.c
	echo -n ', ' >> $TMP_DIR/ft_printf_tester.c
	echo -n $2 >> $TMP_DIR/ft_printf_tester.c
	echo -n ", '">> $TMP_DIR/ft_printf_tester.c
	echo -n $3 >> $TMP_DIR/ft_printf_tester.c
	echo -n "'" >> $TMP_DIR/ft_printf_tester.c
	echo ');return (0);}' >> $TMP_DIR/ft_printf_tester.c
}

create_char_double_star_srcs_files() {
	rm -rf $TMP_DIR
	mkdir -p $TMP_DIR

	echo -en '#include <stdio.h>\nint main(void){printf(' > $TMP_DIR/printf_tester.c
	echo -n $1 >> $TMP_DIR/printf_tester.c
	echo -n ', ' >> $TMP_DIR/printf_tester.c
	echo -n $2 >> $TMP_DIR/printf_tester.c
	echo -n ", ">> $TMP_DIR/printf_tester.c
	echo -n $3 >> $TMP_DIR/printf_tester.c
	echo -n ", '">> $TMP_DIR/printf_tester.c
	echo -n $4 >> $TMP_DIR/printf_tester.c
	echo -n "'" >> $TMP_DIR/printf_tester.c
	echo ');return (0);}' >> $TMP_DIR/printf_tester.c

	echo -en '#include <' > $TMP_DIR/ft_printf_tester.c
	echo -n $HEADER_FILE >> $TMP_DIR/ft_printf_tester.c
	echo -en '>\nint main(void){printf(' >> $TMP_DIR/ft_printf_tester.c
	echo -n $1 >> $TMP_DIR/ft_printf_tester.c
	echo -n ', ' >> $TMP_DIR/ft_printf_tester.c
	echo -n $2 >> $TMP_DIR/ft_printf_tester.c
	echo -n ", ">> $TMP_DIR/ft_printf_tester.c
	echo -n $3 >> $TMP_DIR/ft_printf_tester.c
	echo -n ", '">> $TMP_DIR/ft_printf_tester.c
	echo -n $4 >> $TMP_DIR/ft_printf_tester.c
	echo -n "'" >> $TMP_DIR/ft_printf_tester.c
	echo ');return (0);}' >> $TMP_DIR/ft_printf_tester.c
}
