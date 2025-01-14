[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/paypalme/whitelight976)

Overview
--------------------------------------------
* Name: bashMultiTool
* Description: 

A Bash Shell library file for commonly used functions
can be imported into shell scripts to create functional and colorful 
scripts and Terminal users interfaces(TUI).
The library allows user to redefine commonly used functions every time you write a shell script, the library may save a part of the development time.

* Author: Gavin Lyons
* GNU bash: version 5.1.16

Table of contents
---------------------------

  * [Installation](#installation)
  * [Usage](#usage)
  * [Software](#software)
  * [Example](#example)
  
Installation
-----------------------------------------------

**Linux debian based systems built on Ubuntu 22.04 LTS (Jammy Jellyfish)**
 
A Personal Package Archives (PPA) has been created on Ubuntu
package building and hosting section of launchpad site 
called bashmultitool.

To install this on your system run commands in terminal

```sh
sudo add-apt-repository ppa:typematrix/bashmultitool
sudo apt update
sudo apt install bashmultitool
```

**Arch based System** 

Package available in the Arch Linux user repo AUR

**For other linux systems**

Download latest fixed release and run the makefile as per 
terminal commands below for version 2.1 latest release at time of writing
Note: If you install with this method you will not be informed of updates 
by system.

```sh
curl -sL https://github.com/gavinlyonsrepo/bashmultitool/archive/2.1.tar.gz | tar xz
cd  bashmultitool-2.1
sudo make install
```

Usage
-------------------------------------------

Source the library functions from your bash shell scripts like so:

```sh
LIBPATH="/usr/lib/bashmultitool/"
for MYFILE in "$LIBPATH"*;
do
	source "$MYFILE"
done
```

To access library functions from your shell scripts type:

```sh
# [function-name] [keyword] [options]
# eg

_print_func b_red "Hello World"
 ```

Software
-----------------------------------------

Eight separate markdown help files with detailed information, 
in documentation folder are available.
For shortcut to each help file click on link in 2nd table below. 
A script to print library meta data is also installed.

| Installed File Path | Description |
| ------ | ------ |
| /usr/bin/bashmultitool | Script to print library meta data |
| /usr/lib/bashmultitool/bashmultitool/*  | 8 library files see next table|
| /usr/lib/bashmultitool/doc/README.md   | readme  |  
| /usr/lib/bashmultitool/doc/bmt*.md | 8 Documentation files see next table | 

| Library file | Function | Sections | Content | Doc link |
| ---- | ---- | ---- | ---- | ---- |
|  _print | _print_func | 101 | Printing text | [_print help file](documentation/_print.md)|
|  _prompt_ | _prompt_func | 201-210 | Prompts | [ _prompt_ help file](documentation/_prompt_.md)|
|  _network  | _network_func  | 301-302 | Network related | [_network help file](documentation/_network.md)|
|  _linux | _linux_func | 401-408 | Linux related | [_linux help file](documentation/_linux.md)|
|  _files | _files_func | 501-510 | File related | [_files help file](documentation/_files.md)|
|  _data | btmDataFunc | 601-607 | Data related | [_data help file](documentation/_data.md)|
|  _time | btmTimeFunc | 701-710 | Time related | [_time help file](documentation/_time.md)|
|  _misc  | _misc_func  | 801-806 | Miscellaneous | [_misc help file](documentation/_misc.md)|
|  _test  | _test_func  | 901 |  internal library test | [_test help file](documentation/_test.md)|

The library contains eight section's, Each section has one file with one function. 
Which contains 54 sub-sections in total.
The sections are grouped per logical function.
Printing, prompting, Linux related, file related, 
data related, time related , network related and miscellaneous.
The sections are mostly independent of each other
you can source them individually if you wish, however the prompt file *is* 
dependent on print. There is also  a ninth test section _test used to test library.

The repo also contains a *test folder* where a test file used in development are available, one function for each library file. The test file "testTest.sh", runs an semi-automated test on entire library and produces a report.  Pass the test file a number between 1-9 , 1-8 correspond to the sections, 9 will test entire library. 

Example
----------------------------

Output of basic example file in example folder, showing basic usage.

![ScreenShot](https://raw.githubusercontent.com/gavinlyonsrepo/bashmultitool/master/documentation/screenshot/example.png)

Output report of test script testTest.sh.

![ScreenShot](https://raw.githubusercontent.com/gavinlyonsrepo/bashmultitool/master/documentation/screenshot/test.png)
