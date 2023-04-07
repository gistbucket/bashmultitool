| Library file | Function | Sections | Content | help file|
| ---- | ---- | ---- | ---- | ---- |
|  _files | _files_func | 501-510 | File related | _files.md |

**Section Five,  File**

* 501 Check if directory exists and empty
* 502 Make and enter a formatted directory
* 503 Directory exists
* 504 File exists
* 505 Device exists
* 506 File empty
* 507 File size 
* 508 File size in bytes
* 509 mime  type exists?
* 510 File name extraction

**Sub-Sections**

501) Make formated directory

The keyword is makedir, First option is path , second is the text 
appended to end.

```sh
_files_func makedir "/tmp/" "-TEST"
```

Output folders are created with following time/date stamp syntax 
HHMM-DDMONYY-X where X is text from third option. 
Makes the directory and cds into it
Returns 0 for success, 52 if in cannot access or create the directory
  
502) Does directory exist and is it empty

The keyword is isdirempty , the first option is path returns 0 for empty
 , 2 for not empty , 3 if it does not exist.

```sh
_files_func isdirempty "$HOME/Desktop/TEST/file/"
```

503) directory exists

returns 0 for success, 2 for failure

```sh
_files_func directoryexists /tmp/foo
```

504) file exists

returns 0 for success, 2 for failure

```sh
_files_func fileexists /tmp/foo
```

505) device exists

returns 0 for success, 2 for failure

```sh
_files_func deviceexists /dev/sda
```

506) Empty File
Check if file empty
returns 0 if not empty , 2 if empty

```sh
_files_func isfileempty "/foo/foo.txt"
echo $?
```

507) File size 
Prints file size and returns 0 if file does not exist returns 2
```sh
_files_func getfilesize "/foo/foo.txt"
```

508) File Size in bytes 
Prints file size and returns 0 if file does not exist returns 2
```sh
_files_func getfilesizebytes "/foo/foo.txt"
```

509) Display mime type of input file
Returns 4 If file/directory does not exist. , 3 If file or mimetype command not found in system.
2 if missing arguments, 0 for success. 

```sh
_files_func getmimetype "$TESTOBJECTS/full.txt" >> /tmp/mytempfile123.txt
echo $?
```
510) File name extraction
Returns 0 for success, 2 for missing arguments , 3 for wrong 2nd argument value, 4 for missing file extension

1. Param1 Filepath
2. Param2 1-4 1 for filename, 2 for basename, 3 for extension ,4 for folder path

```sh
_files_func filename "/foo/foo123/tv.png" 4 
echo  " :: Folder name $?"
```
