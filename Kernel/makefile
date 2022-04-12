output: kernel.o message.o
	g++ kernel.o message.o -o output

kernel.o: kernel.cpp
	g++ -c kernel.cpp

message.o: message.cpp message.h
	g++ -c message.cpp

clean:
	del /Q /S *.o output.exe