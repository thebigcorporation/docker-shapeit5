# Original credit to https://github.com/odelaneau/shapeit5
# Makefile modified to work with docker build

#COMPILER MODE C++17
CXX=g++ -std=c++17

#create folders
dummy_build_folder_bin := $(shell mkdir -p bin)
dummy_build_folder_obj := $(shell mkdir -p obj)

#COMPILER & LINKER FLAGS
CXXFLAG=-O3 -mavx2 -mfma
LDFLAG=-O3

#COMMIT TRACING
COMMIT_VERS=$(shell git rev-parse --short HEAD)
COMMIT_DATE=$(shell git log -1 --format=%cd --date=short)
CXXFLAG+= -D__COMMIT_ID__=\"$(COMMIT_VERS)\"
CXXFLAG+= -D__COMMIT_DATE__=\"$(COMMIT_DATE)\"

#DYNAMIC LIBRARIES
DYN_LIBS=-lz -lpthread -lbz2 -llzma -lcurl -lcrypto

HFILE=$(shell find src -name *.h)
CFILE=$(shell find src -name *.cpp)
OFILE=$(shell for file in `find src -name *.cpp`; do echo obj/$$(basename $$file .cpp).o; done)
VPATH=$(shell for file in `find src -name *.cpp`; do echo $$(dirname $$file); done)

NAME=$(shell basename $(CURDIR))
EXEFILE=bin/$(NAME)_static

# Target for docker build
static_exe_docker: CXXFLAG=-O2 -mavx2 -mfma -D__COMMIT_ID__=\"$(COMMIT_VERS)\" -D__COMMIT_DATE__=\"$(COMMIT_DATE)\"
static_exe_docker: LDFLAG=-O2
static_exe_docker: HTSLIB_INC=/usr/local/include/htslib
static_exe_docker: HTSLIB_LIB=/usr/local/lib/libhts.a
static_exe_docker: BOOST_INC=/usr/include/boost
static_exe_docker: BOOST_LIB_IO=/usr/lib/x86_64-linux-gnu/libboost_iostreams.a
static_exe_docker: BOOST_LIB_PO=/usr/lib/x86_64-linux-gnu/libboost_program_options.a
static_exe_docker: $(EXEFILE)

$(EXEFILE): $(OFILE)
	$(CXX) $(LDFLAG) -static -static-libgcc -static-libstdc++ -pthread -o $(EXEFILE) $^ $(HTSLIB_LIB) $(BOOST_LIB_IO) $(BOOST_LIB_PO) -Wl,-Bstatic $(DYN_LIBS)

obj/%.o: %.cpp $(HFILE)
	$(CXX) $(CXXFLAG) -c $< -o $@ -Isrc -I$(HTSLIB_INC) -I$(BOOST_INC)

clean: 
	rm -f obj/*.o $(EXEFILE)
