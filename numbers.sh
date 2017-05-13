#!/bin/bash
a=1
b=2
echo "a is $a"
echo "b is $b"
echo "adding a and b"
echo 'NOTE:  $(expression)) is used for arithmetic expression, $[] is the old style (now deprecated)'
c=$((a + b))
echo "sum is $c"
