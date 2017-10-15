#!/bin/bash
fast src.c src.xml
if [ ! -f ProcessXML.class ]; then
	javac ProcessXML.java
fi
java ProcessXML src.xml srcProcessed.xml
./ComXMLBiYacc get srcProcessed.xml srcAST
if [ ! -d "/srcPb.txt" ]; then
  sudo mkdir /srcPb.txt
fi
echo "" > srcPb.txt
./ComPBBiYacc put srcPb.txt srcAST
if [ ! -f ProcessProto.class ]; then
	javac ProcessProto.java
fi
java ProcessProto srcPb.txt srcPbProcessed.txt
fast -e srcPbProcessed.txt src.pb
fast -d src.pb > srcPbProcessed.txt