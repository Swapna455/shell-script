#!/bin/bash

echo "all variables passes : $@"
echo "numberof variables : $#"
echo "script name : $0"
echo "present working directory : $PWD"
echo "home directory of current user : $HOME"
echo "which user running in script : $USER"
echo "process id of current script : $$"
echo "process id of last command in backgrounf : $!"