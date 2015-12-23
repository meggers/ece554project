javac mars/mips/instructions/*.java -Xlint
javac mars/mips/hardware/*.java -Xlint
javac mars/mips/dump/*.java -Xlint
javac mars/assembler/*.java -Xlint
javac mars/simulator/*.java -Xlint
javac mars/tools/*.java -Xlint
javac mars/venus/*.java -Xlint
jar cmf mainclass.txt Mars.jar PseudoOps.txt Config.properties Syscall.properties Settings.properties MARSlicense.txt mainclass.txt MipsXRayOpcode.xml registerDatapath.xml controlDatapath.xml ALUcontrolDatapath.xml CreateMarsJar.bat Mars.java Mars.class docs help images mars 