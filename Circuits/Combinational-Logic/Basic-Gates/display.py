#!/usr/bin/env python3

import argparse

parser = argparse.ArgumentParser(description= 'verilog display code generation in testbench.')

parser.add_argument('-i', '--inputs', nargs = '*', help = 'Input', required = True)
parser.add_argument('-o', '--outputs', nargs = '*', help = 'Output', required = True)

args = parser.parse_args()

# for debug
# print(args.inputs)
# print(args.outputs)

# append '\t' between elements.
inputs = '\\t'.join(args.inputs)
# print(inputs)
output2 = "\\t".join(args.outputs)

str2_append = inputs + "\\t" + output2

# $monitor statements
outputs = []

for i in range (0, len(args.inputs) + len(args.outputs)):
    outputs.append('%b')

outputs = '\\t'.join(outputs)
# print(outputs)


str1 = '    initial begin'
str2 = '\t$display(""'
str3 = '\t$monitor(""'
str4 = '    end'

str2_index = str2.find("\"") + 1
str2 = str2[:str2_index] + str2_append + str2[str2_index:] + ");"

str3_index = str3.find("\"") + 1
str3 = str3[:str3_index] + outputs + str3[str3_index:] + ", " + \
        ", ".join(str(s) for s in args.inputs) + ", " + \
        ", ".join(str(s) for s in args.outputs) + ", $time);"

print(str1)
print(str2)
print(str3)
print(str4)

