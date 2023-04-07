| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
|  _print | _print_func | 101 | Printing text | _print.md |

**Section One  , Printing**

* 101 Coloured printed text, 8 colours, 7 modes. 56 options in total.

Colours: Black, Red, Green, Yellow, Blue, Purple, Cyan, White.

Modes: normal, bold, underline, background, high intensity,
bold high intensity, background high intensity.  

1. Param1 mode
2. Param2 text to print(optional can be left out just to change cursor colour 
for next objects or text printed ) 

**Sub-Sections**

101) Colored printed text  

The keyword represent the color, the text to be printed is first option.
leave text option blank to just change the colour mode of cursor

```sh
_print_func red    # change colour, no output.
echo "red text"
_print_func norm "default terminal text"

_print_func black "black"
_print_func red "red"
_print_func green "green"
_print_func yellow "yellow" 
_print_func blue "blue "
_print_func purple "purple"
_print_func cyan "cyan"
_print_func white "white" 
_print_func b_black "bold black "
_print_func b_red "bold red  "
_print_func b_green "bold green  "
_print_func b_yellow "bold yellow  "
_print_func b_blue "bold blue  "
_print_func b_purple "bold purple  "
_print_func b_cyan "bold cyan  "
_print_func b_white "bold white  "
_print_func u_black "underline black "
_print_func u_red "underline red  "
_print_func u_green "underline green  "
_print_func u_yellow "underline yellow  "
_print_func u_blue "underline blue  "
_print_func u_purple "underline purple  "
_print_func u_cyan "underline cyan  "
_print_func u_white "underline white  "
_print_func bg_black "background black "
_print_func bg_red "background red  "
_print_func bg_green "background green  "
_print_func bg_yellow "background yellow  "
_print_func bg_blue "background blue  "
_print_func bg_purple "background purple  "
_print_func bg_cyan "background cyan  "
_print_func bg_white "background white  " 
_print_func i_black "high intensity black " 
_print_func i_red "high intensity red  "
_print_func i_green "high intensity green  "
_print_func i_yellow "high intensity yellow  "
_print_func i_blue "high intensity blue  "
_print_func i_purple "high intensity purple  "
_print_func i_cyan "high intensity cyan  "
_print_func i_white "high intensity white  "
_print_func bh_black "high intensity bold black " 
_print_func bh_red "high intensity bold red  "
_print_func bh_green "high intensity bold green  "
_print_func bh_yellow "high intensity bold yellow  "
_print_func bh_blue "high intensity bold blue  "
_print_func bh_purple "high intensity bold purple  "
_print_func bh_cyan "high intensity bold cyan  "
_print_func bh_white "high intensity bold white  "
_print_func hbg_black "high intensity background black " 
_print_func hbg_red "high intensity background red  "
_print_func hbg_green "high intensity background green  "
_print_func hbg_yellow "high intensity background yellow  "
_print_func hbg_blue "high intensity background blue  "
_print_func hbg_purple "high intensity background purple  "
_print_func hbg_cyan "high intensity background cyan  "
_print_func hbg_white "high intensity background white  " 
```

**Example Output:**

![ScreenShot](https://raw.githubusercontent.com/gavinlyonsrepo/bashmultitool/master/documentation/screenshot/colour_print_example.png)

![ScreenShot](https://raw.githubusercontent.com/gavinlyonsrepo/bashmultitool/master/documentation/screenshot/output_test_print.png)
