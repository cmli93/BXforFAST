target+=srcPbProcessed1.txt
target+=srcProcessedAST
target+=src-merged.c
target+=src-patched.xml
target+=srcmodifiedProcessed.xml
target+=srcmodifiedAST
target+=srcmodifiedPb2.txt

all: $(target)

%.xml: %.c
	fast $^ $@

%PbProcessed.txt: %.pb
	fast -d $^ > $@

%2.txt: %Process.pb
	fast -d $^ > $@

%-merged.c: %-patched.xml
	fast $*-patched.xml $@

%2.pb: %PbProcessed.txt
	fast -e $^ $@

%modifiedPbProcess.pb: %.c patched.c
	fast $*.c $*.pb
	fast patched.c patched.pb
	fast -D $*.pb patched.pb
	mv $*\=patched-diff.pb-patched.pb.pb $@

%Pb.txt: %ProcessedAST
	echo "" > $*Pb.txt
	../ComPBBiYacc put $*Pb.txt $*ProcessedAST

%modifiedAST: %modifiedPb2.txt
	../ComPBBiYacc get $^ $@

%modifiedProcessed.xml: %modifiedAST
	../ComXMLBiYacc put $*Processed.xml $*modifiedAST

%ProcessedAST: %Processed.xml
	../ComXMLBiYacc get $*Processed.xml $@

%Processed.xml: ../ProcessXML.class %.xml
	java -cp .. ProcessXML $*.xml $@

%PbProcessed1.txt: ../ProcessProto.class %Pb.txt
	java -cp .. ProcessProto $*Pb.txt $@

%-patched.xml: ../ReverseProcessXML.class %modifiedProcessed.xml
	java -cp .. ReverseProcessXML $*modifiedProcessed.xml $@

%modifiedPb2.txt: ../ReverseProcessProto.class %modifiedPbProcessed.txt
	java -cp .. ReverseProcessProto $*modifiedPbProcessed.txt $@

../%.class: ../%.java
	javac $^

clean::
	rm -f $(target) *.xml *.pb *AST
