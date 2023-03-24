#!/usr/bin/env python3

import argparse

parser = argparse.ArgumentParser(description = 'verilog testbench code generation.')

parser.add_argument('-n', '--name', help = 'Module name', required = True)
parser.add_argument('-i', '--input', nargs = '*', help = 'Input ports', required = True)
parser.add_argument('-o', '--output', nargs = '*', help = 'Output ports', required = True)

args = parser.parse_args()

# arguments
fileName    = args.name
inputPorts  = args.input
outputPorts = args.output

# generate *.v testbench
file = open(fileName + '_tb.v', 'w')

# append \t between each elements
inputTab  = '\\t'.join(inputPorts)
outputTab = '\\t'.join(outputPorts)

displayAppend = inputTab + "\\t" + outputTab

# for monitor statements
monitorAppend = []

for i in range(0, len(inputPorts) + len(outputPorts)) :
    monitorAppend.append('%b')

monitorAppend = '\\t'.join(monitorAppend)

# standard statements
module      = 'module '
declareReg  = '    reg  [x : x] '
declareWire = '    wire [x : x] '
moduleInst  = '    '
initBegin   = '    initial begin'
display     = '        $display("'
monitor     = '        $monitor("'
endBegin    = '    end'
dumpFile    = '        $dumpfile("'
dumpVars    = '        $dumpvars(0, '
endModule   = 'endmodule'

result = []

# module
moduleName = module + fileName + "_tb;"
result.append(moduleName)

result.append("")

# reg
for i in inputPorts :
    result.append(declareReg + i + ";")

result.append("")

# wire
for i in outputPorts :
    result.append(declareWire + i + ";")

result.append("")

# module Inst
moduleInst = moduleInst + fileName + " inst1 (" + \
            ", ".join(str(s) for s in inputPorts + outputPorts) + ");"
result.append(moduleInst)

result.append("")
# dumpfile & dumpvars
result.append(initBegin)
result.append(dumpFile + fileName + ".vcd\");")
result.append(dumpVars + fileName + "_tb);")
result.append(endBegin)

result.append("")

# display & monitor
result.append(initBegin)
result.append(display + displayAppend + "\");")
result.append(monitor + monitorAppend + "\", " + \
              ", ".join(str(s) for s in inputPorts + outputPorts) + \
              ", "  + "$time);")
result.append(endBegin)
result.append("")

result.append(endModule)

# print all
for i in result :
    print(i)

fileResult = "\n".join(result)
for i in fileResult :
    file.write(i)




