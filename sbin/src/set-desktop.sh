#!/bin/sh

mode=-z
while getopts :cstz opt
do
    case $opt in
    (c) mode=-c ;;  # center
    (s) mode=   ;;  # scale
    (t) mode=-t ;;  # tile
    (z) mode=-z ;;  # zoom
    (*) break   ;;
    esac
done
shift $((OPTIND - 1))

exec bgs $mode "$@"
