TOP=$(shell dirname $(abspath $(dir $(word 2, $(MAKEFILE_LIST)))))

-include $(HOME)/enc.mak

CC=gcc
CXX=g++
MAKDIR=$(TOP)/mak
INCDIR=$(TOP)/include
LIBDIR=$(TOP)/lib
BINDIR=$(TOP)/bin

$(shell mkdir -p $(INCDIR))
$(shell mkdir -p $(INCDIR)/host)
$(shell mkdir -p $(INCDIR)/enclave)

$(shell mkdir -p $(LIBDIR))
$(shell mkdir -p $(LIBDIR)/tmp)
$(shell mkdir -p $(LIBDIR)/enclave)
$(shell mkdir -p $(LIBDIR)/host)

$(shell mkdir -p $(BINDIR))

$(shell rm -f $(INCDIR)/enclave/oecommon)
#$(shell ln -s ../oecommon $(INCDIR)/enclave/oecommon)
$(shell rm -f $(INCDIR)/host/oecommon)
#$(shell ln -s ../oecommon $(INCDIR)/host/oecommon)

$(shell rm -f $(INCDIR)/enclave/oeinternal)
#$(shell ln -s ../oeinternal $(INCDIR)/enclave/oeinternal)
$(shell rm -f $(INCDIR)/host/oeinternal)
#$(shell ln -s ../oeinternal $(INCDIR)/host/oeinternal)

MEMCHECK=valgrind --tool=memcheck --leak-check=full

CACHEGRIND=valgrind --tool=cachegrind --cachegrind-out-file=cachegrind.out
CG_ANNOTATE=cg_annotate --auto=yes $(CG_ANNOTATE_INCLUDES) cachegrind.out

CALLGRIND=valgrind --tool=callgrind --callgrind-out-file=callgrind.out
CALLGRIND_ANNOTATE=callgrind_annotate $(CALLGRIND_ANNOTATE_INCLUDES) callgrind.out

define NEWLINE


endef

TRUE=1
