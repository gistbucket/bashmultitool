| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
|  _time  | _time_func  | 701-710  | Timing related | _time.md |

**Section Seven, Time**

* 701 Convert time to  epoch time 
* 702 Print current time Stamp
* 703 Spinner Animation multiple character for long non-verbose commands
* 704 - 707 Stopwatch / timer
* 708 Progress Bar
* 709 Convert Epoch time to date format
* 710 Spinner Animation single character for long non-verbose commands

**Sub-Sections**

701) Converts passed date-time string to  UNIX epoch time

```sh
_time_func epochconvert "2022-04-27 19:42:01 "
```

702) Print current unix epoch time.

```sh
_time_func epochnow
```

703) Spinner Animation for non-verbose process/commands that take long time

```sh
	# call spinner section put run in background and save PID
	_time_func  spin &
	pid=$!
	disown
	
	# 'do stuff'
	echo "START"
	find ~ -name mint 2>/dev/null 
	echo "END"
	
	# Stop spin function with PID
	kill $pid 
	sleep 2
```

704-707) Stop watch

Stop watch timer that returns value in seconds between the stop and start
with a scale of 6. Mircoseconds  1.000000.
startwatch creates a global variable called _BMT_START_WATCH
and uses bc  An arbitrary precision calculator language.

```sh
_time_func startWatch
sleep 2.8
_time_func stopWatch
# returns  ~ 2.813207
```
708) Progress Bar

Parameter 1, time in seconds to increment bar 

Displays a progress bar the increment is passed by user
The progress displays a percentage and a count of number of times
percentage completed.

```sh
	echo " "
	echo "Test 708 "
	_time_func  progressbar 1 &
	pid=$!
	disown
	echo "START"
	sleep 25 # do stuff 25 seconds for one progress bar complete pass
	echo " "
	echo "END"
	# Stop spin function with PID
	kill $pid
	sleep 2
	echo " "
```

709) Convert Epoch time to date format

```sh
_time_func dateformat "1651084921" "%FT%T%z"
# prints ~ 2022-04-27T19:42:01+0100
```

710) Spinner Animation, number  two for long non-verbose commands

```sh
	# call spinner section put run in background and save PID
	_time_func  spintwo &
	pid=$!
	disown
	
	# 'do stuff'
	find ~ -name mint 2>/dev/null 
	
	# Stop spintwo function with PID
	kill $pid 
	sleep 2
```
