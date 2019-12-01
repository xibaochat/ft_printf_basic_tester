# ft_printf tester

## How To

Define the name of your library + header file containing the function **ft_printf** in the config file **srcs_tester/config.sh**

Example
```
# Name of your library file
LIBRARY=libftprintf.a

# Related header file
HEADER_FILE=libftprintf.h

# Directory where the tests will be done
TMP_DIR=./tmp/

# File name to store failed tests
FAILED_TESTS=failed_tests
```

Copy your library + headerfile in the root directory.
```
cp /PATH/TO/libftprintf.a ./
cp /PATH/TO/libftprintf.h ./
```

Launch the tests:
```
bash tester.sh
```

Check if some tests failed by looking into the file define in the variable **FAILED_TESTS**
```
cat ./failed_tests
```