#!/usr/bin/make
## makefile (for swank-tools applications)
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: clean clobber
.DEFAULT_GOAL := all

include ./build/rules.mk

all: build

APPS = 
BINS = $(patsubst $(APPDIR)/%,$(BINDIR)/%, $(APPS:.cpp=))

CLAPPS =                    \
  $(APPDIR)/swank.lisp      \
  $(APPDIR)/swank-send.lisp
CLBINS = $(patsubst $(APPDIR)/%,$(BINDIR)/%, $(CLAPPS:.lisp=))

CYAPPS = 
CYBINS = $(patsubst $(APPDIR)/%,$(BINDIR)/%, $(CYAPPS:.pyx=))

build: init $(CLBINS)

$(BINDIR)/swank: $(APPDIR)/swank.lisp
	./build/sbclc -o $@ -c $^

$(BINDIR)/swank-send: $(APPDIR)/swank-send.lisp
	./build/sbclc -o $@ -c $^

clobber: clean
	-rm -f $(BINS)
	-rm -f $(CLBINS)
	-rm -f $(BINDIR)/system

## *EOF*
