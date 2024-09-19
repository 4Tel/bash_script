#!/bin/bash

# ${var#pattern} - Removes smallest string from the left side that matches the pattern.
# ${var##pattern} - Removes the largest string from the left side that matches the pattern.
# ${var%pattern} - Removes the smallest string from the right side that matches the pattern.
# ${var%%pattern} - Removes the largest string from the right side that matches the pattern.
foo="foo-bar-foobar"
echo -e "-string: ${KGRN}${foo}${KNRM}"
# echoes 'bar-foobar'  (Removes 'foo-' because that matches '*-')
echo -e "long tail(#*-): ${KGRN}${foo#*-}${KNRM}"
# echoes 'foobar' (Removes 'foo-bar-')
echo -e "short tail(##*-): ${KGRN}${foo##*-}${KNRM}"
# echoes 'foo-bar'
echo -e "lone head(%-*): ${KGRN}${foo%-*}${KNRM}"
# echoes 'foo'
echo -e "short head(%%-*): ${KGRN}${foo%%-*}${KNRM}"

