#!/usr/bin/python3

from json import loads, dumps
from subprocess import check_output
from sys import argv

occupied_workspaces = [workspace["id"] for workspace in loads(
    check_output(["hyprctl", "workspaces", "-j"])) if workspace["windows"] > 0]

print(dumps(int(argv[1]) in occupied_workspaces))
