#!/bin/bash

test_banner() {
	echo -e "\t${GREEN}==${YELLOW}==${RED}== ${GREY}$1 ${GREEN}==${YELLOW}==${RED}==${NC}"
}

sub_test_banner() {
	echo -e "${DARK_GRAY}--- $1 ---${NC}"
}
