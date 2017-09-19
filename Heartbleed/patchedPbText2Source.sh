javac ReverseProcessProto.java
#我是注释行
java ReverseProcessProto modifiedPbProcessed.txt modifiedPb.txt
./ComPBBiYacc get modifiedPb.txt srcAST
./ComXMLBiYacc put srcProcessed.xml srcAST
javac ReverseProcessXML.java
#我是注释行
java ReverseProcessXML srcProcessed.xml src.xml
srcml src.xml -o src.c
