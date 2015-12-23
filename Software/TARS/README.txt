In order to run MARS in the GUI mode, open a cmd window in this folder and type

java -jar Mars.jar

GUI mode is usefull for stepping through, stepping back, and being able to view the registor file
and memory throughout execution




To run MARS in the command line mode, run

java -jar mars.jar dump [start address]-[end address] HexText [output].txt [input].asm

This will assemble and run input.asm and dump the memory stored between the specified addresses in
output.txt in hex with one word per line