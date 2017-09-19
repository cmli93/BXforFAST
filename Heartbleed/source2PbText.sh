#!/bin/bash
fast src.c src.xml
if [ ! -f ProcessXML.class ]; then
	javac ProcessXML.java
fi
if [ ! -f srcProcessed.xml ]; then
	java ProcessXML src.xml srcProcessed.xml
fi
./ComXMLBiYacc get srcProcessed.xml srcAST
echo "" > srcPb.txt
./ComPBBiYacc put srcPb.txt srcAST
if [ ! -f ProcessProto.class ]; then
	javac ProcessProto.java
fi
java ProcessProto srcPb.txt srcPbProcessed.txt
fast -e srcPbProcessed.txt src.pb
fast -d src.pb > srcPbProcessed.txt 
