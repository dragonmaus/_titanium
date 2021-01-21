#!/usr/local/bin/python3

from sys import stdin, stdout
from yaml import load, dump
try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper

dump(load(stdin, Loader=Loader),
     stdout,
     default_flow_style=False,
     explicit_start=True,
     explicit_end=True,
     indent=2)
