| Library file | Function | Sections | Content | help file |
| ---- | ---- | ---- | ---- | ---- |
|  _prompt_ | _prompt_func | 201-210 | Prompts | _prompt_.md|


**Section Two,  Prompts**
 
* 201 Horizontal lines across terminal, in any colour
* 202 yes-no-quit [y/n/q] loop prompt
* 203 yes-NO [y/N] prompt
* 204 YES-no [Y/n] prompt
* 205 Anykey to continue prompt, in any colour
* 206 quit-NO [q/N] prompt
* 207 QUIT-no [Q/N] prompt
* 208 Wish to continue loop prompt 
* 209 Print centered text
* 210 Print event status

**Sub-Sections**

201) Horizontal lines across terminal of single character

Keyword is line, first option the character, second option is colour,
if no colour passed default is "bold cyan"

```sh
_prompt_func line    "=" 
_prompt_func line    "8" red
```

202) yes-no-quit prompt y/n/q

Keyword is yesnoquit , returns codes based on user input

```sh
echo  "Do you want to foo? [y/n/q] :"
_prompt_func yesnoquit
```
Returns 0 for yes , 2 for no , 3 for quit

203) Yes-no prompt [y/N] where no is default

Keyword is yesno , returns codes based on user input
second option yes 

```sh
echo "Do you want to foo? [y/N] :"
_prompt_func yesno yes
```
Returns 0 for yes , 2 for no , 50 for bad user option

204) Yes-no prompt [Y/n] where yes is default

Keyword is yesno , returns codes based on user input
second option is no 

```sh
echo "Do you want to foo? [Y/n] :"
_prompt_func yesno no
```
Returns 0 for no , 2 for yes , 50 for bad user option

205) Anykey prompt

Keyword is anykey , first option amended text, second option is colour,
if no colour passed default is "bold cyan"

```sh
_prompt_func anykey "my Text here"
_prompt_func anykey "my Text here" u_red
```

206) QUIT-no prompt [q/N] where quit is default

Keyword is quitno , returns codes based on user input
second option quit 

```sh
echo "Do you want to foo? [q/N] :"
_prompt_func quitno quit
```
Returns 0 for quit , 2 for no , 50 for bad user option

207) quit-NO prompt [Q/n] where no is default

Keyword is quitno , returns codes based on user input
second option no 
```sh
echo "Do you want to foo? [Q/n] :"
_prompt_func quitno no
```
Returns 0 for no , 2 for quit , 50 for bad user option

208)  Wish to continue loop prompt 
Exits program if user presses N , continues if user presses yes.
Param1 Message Custom. Param2 is colour,
if no colour passed default is "bold cyan"

```sh
_prompt_func wishtocontinue "Do you wish to contine?"
````
209) Print centred text in terminal

```sh
_prompt_func centertext "Hello World." 
````

210) Print an event status , Installing bashMultiTool ...... [OK]

* Param 1 text on  left 
* Param 2 text on right
* Param 3 colour , if no colour passed default is "bold cyan"

```sh
_prompt_func eventstatus "Installing bashMultiTool" "OK" 
````
