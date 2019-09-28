#!/bin/sh

redo-ifchange all.list

sed 's/$/.exe/' < all.list | tr '\n' '\0' | xargs -0 redo-ifchange
