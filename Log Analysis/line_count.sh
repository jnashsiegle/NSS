#!/bin/bash
# Simple line count example, using bash
#
# Bash tutorial: http://linuxconfig.org/Bash_scripting_Tutorial#8-2-read-file-into-bash-array
# My scripting link: http://www.macs.hw.ac.uk/~hwloidl/docs/index.html#scripting
#
# Usage: ./line_count.sh file
# -----------------------------------------------------------------------------

# Link filedescriptor 10 with stdin
exec 10<&0
# stdin replaced with a file supplied as a first argument
exec < $1
# remember the name of the input file
in=$1

# this while loop iterates over all lines of the file
while read LINE
do
    # increase line counter 
    ((count++))

done

echo "Number of lines: $count"

# restore stdin from filedescriptor 10
# and close filedescriptor 10
exec 0<&10 10<&-

