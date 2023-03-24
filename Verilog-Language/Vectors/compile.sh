#!/bin/bash

file_name=$1

if [ -n "$1" ]
then
    echo "Compile $1 ... "
else
    echo "No input verilog file"
fi

result=`iverilog $1.v -o $1 2>&1`

if [ -n "$result" ]
then
    echo "$result"
    echo "Retry!"
else
    echo "Compile success!"
fi

./$1

gtkwave $1.vcd

