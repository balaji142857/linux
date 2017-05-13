#!/bin/bash

echo $BASH_VERSION

echo "loops demo"

#static range -n is to suppress the new line
for i in 1 2 3 4
do
        echo -n $i
done
echo


#in a rage
for i in {0..4}
do
echo -n "welcom $i, "
done
echo

#from a sequence - do not use seq, it is outdated

#traditional three arg form
for (( i=0; i<5; i++ ))
do
echo -n $i
done
echo

#directory contents
for i in /tmp/*
do
        echo $i
done
echo