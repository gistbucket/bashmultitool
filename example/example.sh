#!/bin/bash

#==HEADER==
#  Title : Bashmultitool example.sh
# Description:
# A basic example file to show use of library shown in output  screenshot
# Readme.md
# URL: https://github.com/gavinlyonsrepo/bashmultitool

# Source the library
LIBPATH="/usr/lib/bashmultitool/"
for MYFILE in "$LIBPATH"*; do
	source "$MYFILE"
done

function Display_func {
	_misc_func title 3 2 '#' "Bashmultitool library Demo"
	_misc_func drawbox 3 2 "A file to demo bash library" "Written by Gavin Lyons "
	_prompt_func anykey "and download files " b_cyan
	_prompt_func eventstatus "File 1 Download" "OK" b_green
	_prompt_func eventstatus "File 2 Download" "Fail" b_red
	_prompt_func eventstatus "File 3 Download" "Fail" b_red
	_print_func b_cyan "Do you want to Log error? [y/n/q] :"
	_prompt_func yesnoquit b_yellow
	case $? in
	0)
		_print_func b_red
		_linux_func log "NOTICE" "File 2 failed" mylog /tmp/ "MES"
		_linux_func log "NOTICE" "File 3 failed" mylog /tmp/ "MES"
		;;
	2) _print_func norm "No logging done!" ;;
	3) exit 1 ;;
	esac
	_print_func b_cyan "Do you want to Upload log file ? [y/n/q] :"
	_prompt_func yesnoquit b_yellow
	case $? in
	0)
		_print_func b_green "Uploading Log file"
		_time_func progressbar 1 &
		pid=$!
		disown
		sleep 25 # do here stuff
		echo " "
		_prompt_func eventstatus "Log File uploaded" "OK" b_green
		# Stop spin function with PID
		kill $pid
		;;
	2) : ;;
	3) exit 1 ;;
	esac
	_prompt_func anykey "to exit" b_cyan
}

#=== MAIN CODE ===
clear
Display_func
# === END ===
