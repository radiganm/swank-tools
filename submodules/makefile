#!/usr/bin/make -f
## makefile
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: submodules clean clobber update install
.DEFAULT_GOAL := submodules

submodules:

update:
	git submodule init && git submodule update --recursive --remote

install:
	$(MAKE) -C ./asdf-central-registry $@

## *EOF*
