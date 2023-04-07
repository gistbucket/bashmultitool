#!/bin/bash
#shellcheck disable=SC1090 # source "$MYFILE"

# === HEADER ===
#Name: testTest.sh
#Description: File to run Automatic tests on library bashmultitool
#URL: https://github.com/gavinlyonsrepo/BashMultiTool

# === FUNCTIONS ===

function testprintFunc {
	printf "%s\n" "=== Start Print Tests === " # Section 1
	#error handling check(catch typos) 10E
	echo "Error handling"
	_print_func
	_test_func "$?" 255 "10E-a"
	_print_func foofoo
	_test_func "$?" 255 "10E-b"

	#print text

	#reg 1
	echo
	_print_func norm "reg colours"
	echo
	_print_func black "black"
	_print_func red "red "
	_print_func green "green "
	_print_func yellow "yellow" #tan
	_print_func blue "blue "
	_print_func purple "purple "
	_print_func cyan "cyan "
	_print_func white "white  " #light grey

	#bold 2
	echo
	_print_func norm "bold colours"
	echo
	_print_func b_black "bold black " #dark grey
	_print_func b_red "bold red  "
	_print_func b_green "bold green  "
	_print_func b_yellow "bold yellow  "
	_print_func b_blue "bold blue  "
	_print_func b_purple "bold purple  "
	_print_func b_cyan "bold cyan  "
	_print_func b_white "bold white  "

	# underline 3
	echo
	_print_func norm "underline colours"
	echo
	_print_func u_black "underline black "
	_print_func u_red "underline red"
	_print_func u_green "underline green  "
	_print_func u_yellow "underline yellow  "
	_print_func u_blue "underline blue  "
	_print_func u_purple "underline purple  "
	_print_func u_cyan "underline cyan  "
	_print_func u_white "underline white  "

	# background  4
	echo
	_print_func norm "background colours"
	echo
	_print_func bg_black "background black "
	_print_func bg_red "background red  "
	_print_func bg_green "background green  "
	_print_func bg_yellow "background yellow  "
	_print_func bg_blue "background blue  "
	_print_func bg_purple "background purple  "
	_print_func bg_cyan "background cyan  "
	_print_func bg_white "background white  " #very light grey

	# high intensity bold 5
	echo
	_print_func norm "high intensity  colours"
	echo
	_print_func i_black "high intensity black " #very dark grey
	_print_func i_red "high intensity  red  "
	_print_func i_green "high intensity  green  "
	_print_func i_yellow "high intensity  yellow  "
	_print_func i_blue "high intensity blue  "
	_print_func i_purple "high intensity purple  "
	_print_func i_cyan "high intensity cyan  "
	_print_func i_white "high intensity white  "

	# high intensity bold 6
	echo
	_print_func norm "high intensity bold  colours"
	echo
	_print_func bh_black "high intensity bold black " #very dark grey
	_print_func bh_red "high intensity bold red  "
	_print_func bh_green "high intensity bold green  "
	_print_func bh_yellow "high intensity bold yellow  "
	_print_func bh_blue "high intensity bold blue  "
	_print_func bh_purple "high intensity bold purple  "
	_print_func bh_cyan "high intensity bold cyan  "
	_print_func bh_white "high intensity bold white  "

	# high intensity bold 7
	echo
	_print_func norm "high intensity background colours"
	echo
	_print_func hbg_black "high intensity background black " #light grey
	_print_func hbg_red "high intensity background red  "
	_print_func hbg_green "high intensity background green  "
	_print_func hbg_yellow "high intensity background yellow  "
	_print_func hbg_blue "high intensity background blue  "
	_print_func hbg_purple "high intensity background purple  "
	_print_func hbg_cyan "high intensity background cyan  "
	_print_func hbg_white "high intensity background white  " # very light grey
	_test_func 1 1 "101-a" "NOAUTO"
}

function testpromptFunc {
	printf "%s\n" "=== Start Prompt Tests === " # Section 2
	#error handling check(catch user typos)
	echo "Error handling :: "
	_prompt_func
	_test_func "$?" 255 "20E-a"
	_prompt_func foo
	_test_func "$?" 255 "20E-b"

	#draw a line 201
	printf "\n%s\n" "Test 201 :: Draw Line  "
	_prompt_func line "=" red
	printf "%s\n" "Before Line"
	_prompt_func line "+"
	printf "%s\n\n" "After line"

	_prompt_func line "=" green
	_prompt_func line "#" b_cyan
	_test_func 1 1 "201-a" "NOAUTO"

	# Associate key value array' to hold expected prompt return values
	declare -A resArr res1Arr res2Arr res3Arr res4Arr
	local key

	# yesnoquit 202
	resArr+=(["y"]=0 ["n"]=2 ["q"]=3)
	printf "%s\n" "Test 202  :: yesnoquit"
	for key in "${!resArr[@]}"; do
		printf "%s\n" "press ${key}  [y/n/q] :-"
		_prompt_func yesnoquit b_yellow
		_test_func "$?" "${resArr[${key}]}" "202-${key}"
	done

	# yesno yes 203 [ y/N],  return 0 for yes
	#  'a' here represents "any other key"
	res1Arr+=(["y"]=0 ["n"]=2 ["a"]=2)
	printf "\n%s\n" "Test 203  :: yesno yes"
	for key in "${!res1Arr[@]}"; do
		printf "%s\n" "press ${key}  [y/N] :-"
		_prompt_func yesno yes
		_test_func "$?" "${res1Arr[${key}]}" "203-${key}"
	done

	# yesno no 204  [Y/n],  return 0 for no
	#  'a' here represents "any other key"
	res2Arr+=(["y"]=2 ["n"]=0 ["a"]=2)
	printf "\n%s\n" "Test 204  :: yesno no"
	for key in "${!res2Arr[@]}"; do
		printf "%s\n" "press ${key}  [Y/n] :-"
		_prompt_func yesno no
		_test_func "$?" "${res2Arr[${key}]}" "204-${key}"
	done

	# user type catch 203 & 204
	printf "\n%s\n" "catch user type keyword for test 203 & 204"
	_prompt_func yesno foofoo
	_test_func "$?" 51 "204-d"

	# anykey prompt 205
	printf "\n%s\n" "Test 205-a  anykey test "
	_prompt_func anykey "" u_green
	echo "my text here"
	_prompt_func anykey " and go on to next step"
	echo "my text here"
	_test_func 1 1 "205-a" "NOAUTO"

	# quitno quit 206 [ q/N],  return 0 for quit
	#  'a' here represents "any other key"
	res3Arr+=(["q"]=0 ["n"]=2 ["a"]=2)
	printf "\n%s\n" "Test 206  :: quitno quit"
	for key in "${!res3Arr[@]}"; do
		printf "%s\n" "press ${key}  [q/N] :-"
		_prompt_func quitno quit
		_test_func "$?" "${res3Arr[${key}]}" "206-${key}"
	done

	#quitno no 207  [Q/n] :  return 0 for no
	#  'a' here represents "any other key"
	res4Arr+=(["q"]=2 ["n"]=0 ["a"]=2)
	printf "\n%s\n" "Test 207  :: quitno no"
	for key in "${!res4Arr[@]}"; do
		printf "%s\n" "press ${key}  [Q/n] :-"
		_prompt_func quitno no
		_test_func "$?" "${res4Arr[${key}]}" "207-${key}"
	done

	# user type catch 206 & 207
	printf "\n%s\n" "Catch user type keyword for test 206 & 207"
	_prompt_func quitno foofoo
	_test_func "$?" 51 "207-d"

	#208
	printf "\n%s\n" "Test 208"
	_prompt_func wishtocontinue "Do you wish to continue?" b_yellow
	_test_func "$?" 0 "208-a"
	printf "\n%s\n" "Continued "

	#209
	printf "\n%s\n" "Test 209 center text"
	_prompt_func centertext "Hello World."
	_test_func 1 1 "209-a" "NOAUTO"

	#210
	printf "\n%s\n" "Test 210 event status"
	_prompt_func eventstatus "Installing bashMultiTool" "OK" b_green
	_prompt_func eventstatus "File upload" "Fail" b_red
	_prompt_func eventstatus "File upload" "Pending"
	_test_func 1 1 "210-a" "NOAUTO"

}

function testnetworkFunc {
	printf "|\n%s\n" "=== Start Network Tests === " # Section 3
	# error handling check(catch typos)
	echo "Error handling"
	_network_func
	_test_func "$?" 255 "30E-a"
	_network_func foo
	_test_func "$?" 255 "30E-b"

	# 301 checknet
	echo " "
	echo "Test 301 "
	_network_func checknet "www.google.ie"
	_test_func "$?" 0 "301-a"
	_network_func checknet "www.fgfoofoondoid4gnd.ie"
	_test_func "$?" 2 "301-b"
	_network_func checknet "www.google.ie" "NOMES"
	_test_func "$?" 0 "301-c"
	_network_func checknet "www.ggleff11199g.ie" "NOMES"
	_test_func "$?" 2 "301-d"

	# 302
	echo " "
	echo "Test 302 "
	_network_func weather Cork 4
	_test_func "$?" 0 "302-a"
}

function testlinuxFunc {
	printf "\n%s\n" "=== Start Linux Tests === " # Section 4
	#check for bad user input
	_linux_func foo
	_test_func "$?" 255 "40E-a"
	_linux_func foo
	_test_func "$?" 255 "40E-b"

	# checkpac
	printf "\n%s\n" "check packages 401"
	_linux_func checkpac "cylondeb" 2 #installed package
	_test_func "$?" 0 "401-a"
	_linux_func checkpac "foooodds" 2 #non installed package
	_test_func "$?" 2 "401-b"

	_linux_func checkpac "cylondeb" 2 "MES" #installed package
	_test_func "$?" 0 "401-c"
	_linux_func checkpac "fooigkfnmgi" 2 "MES" #non installed package
	_test_func "$?" 2 "401-d"

	# distrocheck
	printf "\n%s\n" " Check distro 402"
	_linux_func distrocheck
	_test_func "$?" 4 "402-a"

	# env text editor check
	echo
	printf "\n%s\n" "Is text editor set? 403"
	echo "$EDITOR"
	_linux_func editor_set
	echo "$?"
	echo "$EDITOR"
	_test_func 1 1 "403-a" "NOAUTO"

	# logfile
	printf "\n%s\n" "logfile 404"
	# error handing non valid label test
	_linux_func log "non valid label test " "overflow" mylog /tmp/
	_test_func "$?" 55 "404-a"
	echo

	# section subsection
	_linux_func log "WARNING" "overflow" mylog /tmp/
	_test_func "$?" 0 "404-b"
	_linux_func log "INFO" "my message" mylog /tmp/
	_test_func "$?" 0 "404-c"
	_print_func b_red
	_linux_func log "NOTICE" "my notice" mylog /tmp/ "MES"
	_test_func "$?" 0 "404-d"
	_print_func norm
	_test_func 1 1 "404-e" "NOAUTO"

	#  if user exists on the system
	printf "\n%s\n" "user check 405"
	_linux_func user "gavin"
	_test_func "$?" 0 "405-a"
	_linux_func user "foo12323"
	_test_func "$?" 2 "405-b"

	# check if varible set and empty
	printf "\n%s\n" "Variable check 406"
	local varsetfull="foo"
	local varsetempty=""

	_linux_func isvarempty varsetfull
	_test_func "$?" 0 "406-a"
	_linux_func isvarempty varsetempty
	_test_func "$?" 2 "406-b"
	_linux_func isvarempty foofoo
	_test_func "$?" 3 "406-c"

	printf "\n%s\n" "Root running check 407"
	_linux_func runasroot
	_test_func "$?" 2 "407-a"

	printf "\n%s\n" "Is command  check 408"
	_linux_func iscommand tput
	_test_func "$?" 0 "408-a"
	_linux_func iscommand foofoo
	_test_func "$?" 2 "408-b"
}

function testfileFunc {
	printf "\n%s\n" "=== Start Files  Tests === " # Section 5
	#check for bad user input
	echo "Error handling :"
	_files_func foo
	_test_func "$?" 255 "50E-a"
	_files_func
	_test_func "$?" 255 "50E-b"
	echo

	# 'dir empty '
	echo "DIR EMPTY Test 501"
	_files_func isdirempty "$TESTOBJECTS/EmptyDir/"
	_test_func "$?" 0 "501-a" # empty
	_files_func isdirempty "$TESTOBJECTS/NonEmptyDir/"
	_test_func "$?" 2 "501-b" # non -empty
	_files_func isdirempty "/foo/foo"
	_test_func "$?" 3 "501-c" # does not exist
	echo

	#make dir
	echo "MAKE DIR Test 502"
	_files_func makedir "/tmp/" "-TEST"
	_test_func "$?" 0 "502-a" # success
	_files_func makedir "/foo/" "-foo"
	_test_func "$?" 50 "502-b" # path does not exist
	_files_func makedir "/usr/" "-iamnotroot"
	_test_func "$?" 52 "502-c" # Could not make directory , Permissions maybe
	echo

	# dir exists
	echo "DIR exist 503"
	_files_func directoryexists /tmp/
	_test_func "$?" 0 "503-a" # success
	_files_func directoryexists /tmp/foo
	_test_func "$?" 2 "503-b" # fail
	echo

	# File exists
	echo "File exist 504"
	_files_func fileexists "$TESTOBJECTS/full.txt"
	_test_func "$?" 0 "504-a" # success
	_files_func fileexists /tmp/foo.txt
	_test_func "$?" 2 "504-b" # fail
	echo

	# Device exists
	echo "device exist 505"
	_files_func deviceexists /dev/sda
	_test_func "$?" 0 "505-a" # success
	_files_func deviceexists /dev/sdf
	_test_func "$?" 2 "505-b" # fail
	echo

	# File empty
	echo "file empty 506"
	_files_func isfileempty "$TESTOBJECTS/full.txt"
	_test_func "$?" 0 "506-a" # success
	_files_func isfileempty "$TESTOBJECTS/empty.txt"
	_test_func "$?" 2 "506-b" # fail
	echo " "

	# Get file size
	echo "getfilesize 507"
	_files_func getfilesize "$TESTOBJECTS/tv.png"
	_test_func "$?" 0 "507-a" # success
	_test_func 1 1 "507-b" "NOAUTO"
	_files_func getfilesize "/foo/foo.txt"
	_test_func "$?" 2 "507-c" # fail
	echo

	echo "getfilesizebytes 508"
	_files_func getfilesizebytes "$TESTOBJECTS/tv.png"
	_test_func "$?" 0 "508-a" # success
	_test_func 1 1 "508-b" "NOAUTO"
	_files_func getfilesizebytes "/foo/foo.txt"
	_test_func "$?" 2 "508-c" # fail
	echo

	echo "Get mime type of provided input 509"
	# print to console
	_files_func getmimetype "$TESTOBJECTS/tv.png"
	echo
	_test_func 1 1 "509-a" "NOAUTO"
	echo

	#   send to a file
	_files_func getmimetype "$TESTOBJECTS/full.txt" >>/tmp/mytempfile123.txt
	echo " /tmp/mytempfile123.txt file created"
	_test_func 1 1 "509-b" "NOAUTO"

	_files_func getmimetype "/foo/foo/tv.png"
	_test_func "$?" 4 "509-c" # file does not exist

	# 510
	echo
	echo "Filename extraction 510 /foo/foo123/tv.png"
	_files_func filename "/foo/foo123/tv.png" 1
	echo " :: File name $?"
	_files_func filename "/foo/foo123/tv.png" 2
	echo " :: Base name $?"
	_files_func filename "/foo/foo123/tv.png" 3
	echo " :: Extension $?"
	_files_func filename "/foo/foo123/tv.png" 4
	echo " :: Folder name $?"
	_test_func 1 1 "510-a" "NOAUTO"

	# 510 errors
	_files_func filename # no args passed
	_test_func "$?" 2 "510-b"
	_files_func filename "/foo/foo123/tv.png" # no or wrong condition($2) passed
	_test_func "$?" 3 "510-c"
	_files_func filename "/foo/foo123/tv" 3 # no extension passed.
	_test_func "$?" 4 "510-d"
}

function testdataFunc {
	printf "\n%s\n" "=== Start Data Tests === " # Section 6
	echo "Error handling check"
	_data_func foofoo
	_test_func "$?" 255 "60E-a"
	_data_func
	_test_func "$?" 255 "60E-b"

	# intcheck 601
	printf "\n%s\n" "601-a Enter an integer"
	read -r ID
	_data_func intcheck "$ID"
	_test_func "$?" 0 "601-a"

	printf "\n%s\n" "601-b Enter a NON integer"
	read -r ID
	_data_func intcheck "$ID"
	_test_func "$?" 2 "601-b"

	## alphanumeric 602
	printf "\n%s\n" "602-a Enter an alpha numeric string"
	read -r ID1
	_data_func alphanumcheck "$ID1"
	_test_func "$?" 0 "602-a"

	printf "\n%s\n" "602-b Enter a NON alpha numeric string"
	read -r ID1
	_data_func alphanumcheck "$ID1"
	_test_func "$?" 2 "602-b"

	## alpha check 603
	printf "\n%s\n" "603-a Enter an alphabetical string"
	read -r ID2
	_data_func alphacheck "$ID2"
	_test_func "$?" 0 "603-a"

	printf "\n%s\n" "603-b Enter an NON alphabetical string"
	read -r ID2
	_data_func alphacheck "$ID2"
	_test_func "$?" 2 "603-b"

	# lowercase
	printf "\n%s\n" "604 lowercase test"
	result=$(_data_func lowercase "TEST") # or result=`myfunc`
	printf "%s\n" "$result"
	_test_func 1 1 "604-a" "NOAUTO"

	#uppercase
	printf "\n%s\n" "605 uppercase test"
	result1=$(_data_func uppercase "test")
	printf "%s\n" "$result1"
	_test_func 1 1 "605-a" "NOAUTO"

	# trim
	printf "\n%s\n" "606 trim test"
	mytrim="       test   "
	result2=$(_data_func trim "$mytrim")
	printf "%s\n" "$result2"
	_test_func 1 1 "606-a" "NOAUTO"

	# string length
	printf "\n%s\n" "607 string length test"
	_data_func strlen "test string 123" # 15
	_test_func "$?" 15 "607-a"
	_data_func strlen "" #report 250 error
	_test_func "$?" 250 "607-b"
}

function testtimeFunc {
	printf "\n%s\n" "=== Start Time Tests === " # Section 7
	# error handling check(catch typos)
	printf "%s\n" "Error handling"
	_time_func
	_test_func "$?" 255 "70E-a"
	_time_func foo
	_test_func "$?" 255 "70E-b"

	# 701 , prints 1651084921
	printf "\n%s\n" "701-a Convert time to  epoch time ::"
	_time_func epochconvert "2022-04-27 19:42:01 "
	printf "%s\n" " Pass :: 1651084921"
	_test_func 1 1 "701-a" "NOAUTO"

	# 702
	printf "\n%s\n" "702-b Current time Stamp ::"
	_time_func epochnow
	echo
	_test_func 1 1 "702-b" "NOAUTO"

	# 703 call spinner function put run in background and save PID
	printf "\n%s\n" "Test 703-a  spinner"

	_time_func spin &
	pid=$!
	disown

	sleep 10 # Do stuff here

	kill $pid # Stop spin function with PID
	sleep 1
	printf "\r%s\n" "     "
	_test_func 1 1 "703-a" "NOAUTO"

	# 704-707
	printf "\n%s\n" "Test 704-707 Stopwatch timer"
	_time_func startWatch
	sleep .100
	_time_func stopWatch
	echo " 0.1 S"

	_time_func startWatch
	sleep 1
	_time_func stopWatch
	echo " 1.0 S"

	_time_func startWatch
	sleep 4.8
	_time_func stopWatch
	echo " 4.8 S"
	_test_func 1 1 "704-a" "NOAUTO"

	# 708 call progressbar function put run in background and save PID

	printf "\n%s\n" "Test 708 progress bar "
	_time_func progressbar 1 &
	pid=$!
	disown
	sleep 25  # Do stuff , 25 seconds one bar
	kill $pid # Stop spin function with PID
	sleep 1
	echo
	_test_func 1 1 "708-a" "NOAUTO"

	#709
	printf "\n%s\n" "Test 709 "
	_time_func dateformat "1651084921"
	printf "\n%s\n" " Pass :: 2022-04-27 19:42:01"

	_time_func dateformat "1651084921" "%FT%T%z"
	printf "\n%s\n" " Pass :: 2022-04-27T19:42:01+0100"

	_test_func 1 1 "709-a" "NOAUTO"

	#701 702 & 709 combined
	local timeVar2
	local timeVar
	printf "\n%s\n" " Test 70X-a 701 702 and  709 combined"
	timeVar="$(_time_func epochnow)" # get current time in epoch seconds
	printf "%s\n" "Epoch time in :: $timeVar"
	timeVar2="$(_time_func dateformat "$timeVar")" # Convert that to a date time
	printf "%s\n%s" "Time converted :: $timeVar2" "Epoch Time Out :: "
	_time_func epochconvert "$timeVar2" #  Convert back to epoch
	echo
	_test_func 1 1 "70X-a" "NOAUTO"

	# 710 call spinner function put run in background and save PID
	printf "\n%s\n" "Test 710  spinner"

	_time_func spintwo &
	pid=$!
	disown

	sleep 10 # Do stuff here

	kill $pid # Stop spin function with PID
	sleep 1
	printf "\r%s\n" " "
	_test_func 1 1 "710-a" "NOAUTO"

}

function testmiscFunc {
	printf "\n%s\n" "=== Start Misc Tests === " # Section 8
	# error handling check(catch typos)
	echo "Error handling:: "
	_misc_func # No keyword
	_test_func "$?" 255 "80E-a"
	_misc_func foo # Wrong keyword
	_test_func "$?" 255 "80E-a"

	# 801 password generator
	echo
	_misc_func password "/home/gavin/Documents/Tech/Scripts/BashMultiTool/stuff/"
	_test_func "$?" 0 "801-a"
	echo

	_misc_func password
	_test_func "$?" 0 "801-b"
	echo

	#802 battery level
	echo "802 test"
	_misc_func getbatlevel "BAT0" "MES"
	echo "$?"
	_test_func 1 1 "802-a" "NOAUTO"

	_misc_func getbatlevel "foo" "MES"
	_test_func "$?" 127 "802-b"
	echo

	#803
	echo "803 test box"
	# 1 = red,box 2 = green,text "tput setaf  colours"
	_misc_func drawbox 1 2 'first line' 'second line' 'third line'
	_test_func 1 1 "803-a" "NOAUTO"
	echo
	# 7 = white,box  6= cyan,text "tput setaf  colours"
	_misc_func drawbox 7 6 'hello world'
	_test_func 1 1 "803-b" "NOAUTO"
	echo

	#804
	echo "804 test title"
	# 7 = white,box  6= cyan,text "tput setaf  colours"
	_misc_func title 7 6 '#' 'hello'
	_test_func 1 1 "804-a" "NOAUTO"
	echo
	# 2 = green,box  6= cyan,text "tput setaf  colours"
	_misc_func title 2 6 '+' 'World bye'
	_test_func 1 1 "804-b" "NOAUTO"
	echo

	#805
	echo "805 Test center text"
	_misc_func centertext "Hello World" -
	_test_func 1 1 "805-a" "NOAUTO"
	echo

	_print_func b_red
	_misc_func centertext "HelloWorld In Red" =
	_test_func 1 1 "805-b" "NOAUTO"
	echo

	#806
	echo "806 test Display Gauge"
	_misc_func gauge "Value" 25 1 50 "#" "."
	_test_func 1 1 "806-a" "NOAUTO"
	echo

	_print_func b_red
	_misc_func gauge "Value" 2 1 10 "=" " "
	_test_func 1 1 "806-b" "NOAUTO"
	echo
}

# === MAIN CODE ===
#Source the lib
#(LOCAL path not installed for development)
#LIBPATH="/home/gavin/Documents/Tech/Scripts/BashMultiTool/lib/"
#installed path
LIBPATH="/usr/lib/bashmultitool/"
for MYFILE in "$LIBPATH"*; do
	source "$MYFILE"
done

TESTOBJECTS="$HOME/Documents/Tech/Scripts/BashMultiTool/test/testObjects" # for testfileFunc
declare numberinput="$1"
clear

# Valid input
if [ -z "$numberinput" ]; then # there an input?
	printf "%s\n" "Enter Argument 1-8 or 9 for all tests"
	exit 1
else
	# Valid number?
	[[ "$numberinput" =~ ^[0-9]+$ ]] || {
		printf "%s\n" "Enter a valid number 1-9 "
		exit 1
	}
	# Valid range?
	if ((numberinput == 0 || numberinput >= 10)); then
		printf "%s\n" "Enter a number in range 1-9 "
		exit 1
	fi
fi

_test_func 1 1 "START"
read -n 1 -r -s -p "Press any key to continue"

case "$numberinput" in
1 | 9) testprintFunc ;;&
2 | 9) testpromptFunc ;;&
3 | 9) testnetworkFunc ;;&
4 | 9) testlinuxFunc ;;&
5 | 9) testfileFunc ;;&
6 | 9) testdataFunc ;;&
7 | 9) testtimeFunc ;;&
8 | 9) testmiscFunc ;;
esac

printf "\n"
_test_func 1 1 "END"
# === EOF ===
