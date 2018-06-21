LLVM_CONFIG=llvm-config

CXX=`$(LLVM_CONFIG) --bindir`/clang
CXXFLAGS=`$(LLVM_CONFIG) --cppflags` -fPIC -fno-rtti
LDFLAGS=`$(LLVM_CONFIG) --ldflags`

all: hello.so

hello.so: Hello.o
	$(CXX) -shared Hello.o -o hello.so $(LDFLAGS) -fPIC

Hello.o: Hello.cpp
	$(CXX) -c Hello.cpp -o Hello.o $(CXXFLAGS) -std=c++11

clean:
	rm -f *.o hello.so
