#!/usr/bin/make -f
## makefile (for AILab)
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: clean clobber submodules applications bootstrap update install packages-apt build
.DEFAULT_GOAL := all

BLDDIR=./build

all: build

bootstrap: install

install: build
	$(MAKE) -C ./submodules install

update:
	$(MAKE) -C ./submodules update

build: applications

packages-apt: update
	sudo apt-get install -y sbcl

applications:
	$(MAKE) -f $(BLDDIR)/$@.mk

clean:
	$(MAKE) -f $(BLDDIR)/applications.mk $@

clobber:
	$(MAKE) -f $(BLDDIR)/applications.mk $@

## *EOF*
