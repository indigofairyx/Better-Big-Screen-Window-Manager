

Hello World!

# ![icon](images/MoveTo32x32.png) What is Better Big Screen Window Manager++?

## Intro & Background

This is simple script written in [AutoHotKey](https://autohotkey.com) that improves on and adds to Windows AeroSnap functionality for Window Management with Hotkey & Mouse combos.

I started writing this script a month after getting a 48inch 4k Big Screen TV as computer monitor.

I quickly got tired & annoyed at chasing new windows which would pop up in the far upper left corner of the screen. *Windows itself is quite bad at opening up there.* It was something I never gave never gave much thought to on a 32in 1080p monitor but with this much screen chasing windows **with the mouse** all over the place got old fast!

It was at this point I realized that Windows AeroSnap doesn't have a Hotkey to `Center the Active Window`. So I wouldn't have to chance it with the mouse.

Much Googling and GitHub searching for such a simple window management task lead me to AutoHotKey and my first script.

**It's too good not to share.** Especially if you're working with a **oversized** screen, you should give this a try!!!

## What does Better Big Screen Window Manager++ do??

Example, A simple quick hotkey to...

> `⊞ Win` + `C` will `Center the Active Window` 

or

> `⊞ Win` + `G` will `Grab the Active Window`, bringing it to the mouse pointer rather than the other why around. *This works great on small windows.*

I started having fun with AutoHotKey, discovering way to expand & add to AeroSnap's basic hotkey functions.

I'll add a full list of `Hotkeys` below, but first...

# For the best results `Run as ADMINISTRATOR`


> [!note]
> **Q.** Why does a simple window manager script ask for Admin Control?
>
> **A.** This Admin prompt allows you to move, resize and control windows that are running with elevated status, ie.. the task manager, Microsoft's own internal config windows, disk clean up and\\or program installers etc. As I mentioned *Microsoft own windows are one of the worst at popping up in the far corner of large screen. Such as the Disk Clean Up Tool.* Without Admin Elavation you cannot move these windows.

Windows prevents hotkeys from working in windows that were launched with higher elevation than the AutoHotKey script (such as CMD or Powershell terminals that were launched as Administrator). As a result, AutoHotKey Scripts will only work on these windows if the script itself is `Run as Administrator`, due to the way Windows is designed.

It was defeating the purpose of these hotkeys if I couldn't use them so I added Admin Control to the script.

If you are annoyed by the Admin popups at logon (*which I am*) and are not comfortable with turning off `UAC` you can use the Windows Task Scheduler to ticking the `Run with highest privileges` option.


# How to run Better Big Screen Window Manager++ 

There are two options to use you can...

- **Download the compiled `.exe` from the [Releases](https://github.com/indigofairyx/Better-Big-Screen-Window-Manager/releases) page.**

There is no installation required, it will run as a portable program from anywhere, as long have Admin Access.

or

- **Download and run the `.ahk` itself. Also in the [Releases](https://github.com/indigofairyx/Better-Big-Screen-Window-Manager/releases) page.**
 
**Note that this options requires that you also install [AutoHotKey](https://www.autohotkey.com) to run the script.** *The added benefit here is that you could change the Hotkeys by editing the script.*

# Hotkey List

These are the Hotkeys and Mouse Combos I came up with.

> [!note]
>I expanded many of the hotkeys to the **Number Pad** on a *full-sized keyboard,* if you have a short keyboard you can still run this on a big screen as the Resize & Move options are also bound to the Horizontal & Vertical mouse wheels.


## ***SCRIPT CONTROL***

| HOTKEY                           | ACTION                       |
| -------------------------------- | ---------------------------- |
| `Ctrl` + `Shift` + `Numpad -`    | Reload Window Manager Script |
| `Ctrl` + `Alt` + `⊞ Win` + `ESC` | Exit Window Manager Script   |

 ## ***MOUSE FUNCTIONS*** 

| `⊞ Win` + `Middle Mouse Button` | Send window to back\\bottom                                              |
| ------------------------------- | ------------------------------------------------------------------------ |
| `⊞ Win` + `Wheel Up`            | Move window Up                                                           |
| `⊞ Win` + `Wheel Down`          | Move window Down                                                         |
| `⊞ Win` + `Wheel Left`          | Move Window Right ^^3                                                    |
| `⊞ Win` + `Wheel Right`         | Move Window Left ^^3                                                     |
| `⊞ Win` + `Alt` + `Wheel Down`  | System Volume Down                                                       |
| `⊞ Win` + `Alt` + `Wheel Up`    | System Volume Up                                                         |
| `⊞ Win` + `Ctrl` + `Wheel Down` | Decrease\\Shrink window size                                             |
| `⊞ Win` + `Ctrl` + `Wheel Up`   | Increase\\Grow window size                                               |
|                                 |                                                                          |
| ***CLICK & DRAG***              |                                                                          |
| `⊞ Win` + `Right Button`        | Holding `⊞ Win`, Click & Drag with Right Mouse button to RESIZE a Window |
| `⊞ Win` + `Left Button`         | Holding `⊞ Win`, Click & Drag with Left Mouse button to MOVE a Window    |

## ***HOTKEYS***

### FAST KEYS

| `~` //Double Tap `ESC`             |  Double tap ESC to close the acive window -- {send-F4}                                    |
|------------------------------------|-------------------------------------------------------------------------------------------|
|  `⊞ Win` + `C`                     |  Center active Window  ^^1                                                                |
|  `⊞ Win` + `G`                     |  Grab\\Move\\Bring active window to mouse pointer, works great for small windows ^^2      |
|  `⊞ Win` + `Alt` + `Z`             |  Resize Active Window to 1280x850 and center                                              |
|  `⊞ Win` + `Z`                     |  Resize Active Window to 1920x1080 and center                                             |
|  `⊞ Win` + `Ctrl` + `B`            |  Rezied Active Window to 2953x1726, Centred & Lowered to taskbar                          |
|  `⊞ Win` + `Ctrl` + `R`            |  Restore window from fullscreen                                                           |
|                                    |                                                                                           |
|  `⊞ Win` + `Page Down`             |  Decrease\\Shrink window size                                                             |
|  `⊞ Win` + `Page Up`               |  Increase\\Grow window size    
                                                           
														   
### NUMPAD Keys To Move Active Window

| `⊞ Win` + `Numpad 1` | Movie window DOWN & LEFT       |
| -------------------- | ------------------------------ |
| `⊞ Win` + `Numpad 2` | Move window DOWN               |
| `⊞ Win` + `Numpad 3` | Movie window DOWN & RIGHT      |
| `⊞ Win` + `Numpad 4` | Move window LEFT               |
| `⊞ Win` + `Numpad 5` | Center window                  |
| `⊞ Win` + `Numpad 6` | Move window RIGHT              |
| `⊞ Win` + `Numpad 7` | Movie window UP & LEFT         |
| `⊞ Win` + `Numpad 8` | Move window UP                 |
| `⊞ Win` + `Numpad 9` | Movie window DOWN & RIGHT      |
| `⊞ Win` + `Numpad 0` | Restore window from fullscreen |

### NUMPAD Keys to Dock\\Snap Active Window

| `⊞ Win` + `Alt` + `Numpad 1`       |  Dock\\Snap window bottom-left                                                            |
|------------------------------------|-------------------------------------------------------------------------------------------|
|  `⊞ Win` + `Alt` + `Numpad 2`      |  Snap bottom half of the screen                                                           |
|  `⊞ Win` + `Alt` + `Numpad 3`      |  Dock\\Snap window bottom-right                                                           |
|  `⊞ Win` + `Alt` + `Numpad 4`      |  Snap left half of the screen                                                             |
|  `⊞ Win` + `Alt` + `Numpad 5`      |  Center window                                                                            |
|  `⊞ Win` + `Alt` + `Numpad 6`      |  Snap right half of the screen                                                            |
|  `⊞ Win` + `Alt` + `Numpad 7`      |  Dock\\Snap window top-left                                                               |
|  `⊞ Win` + `Alt` + `Numpad 8`      |  Snap top half of the screen                                                              |
|  `⊞ Win` + `Alt` + `Numpad 9`      |  Dock\\Snap window top-right                                                              |

###  NUMPAD Keys for Quick {Centered} Window Resizing

| `⊞ Win` + `Ctrl` + `Numpad 0` | Resize Active Window to 700x400, centered   |
| ----------------------------- | ------------------------------------------- |
| `⊞ Win` + `Ctrl` + `Numpad 1` | Resize Active Window to 800x600, centered   |
| `⊞ Win` + `Ctrl` + `Numpad 2` | Resize Active Window to 1080x720, centered  |
| `⊞ Win` + `Ctrl` + `Numpad 3` | Resize Active Window to 1224x800, centered  |
| `⊞ Win` + `Ctrl` + `Numpad 4` | Resize Active Window to 1280x850, centered  |
| `⊞ Win` + `Ctrl` + `Numpad 5` | Resize Active Window to 1440x900, centered  |
| `⊞ Win` + `Ctrl` + `Numpad 6` | Resize Active Window to 1600x1000, centered |
| `⊞ Win` + `Ctrl` + `Numpad 7` | Resize Active Window to 1920x1080, centered |
| `⊞ Win` + `Ctrl` + `Numpad 8` | Resize Active Window to 2430x1370, centered |
| `⊞ Win` + `Ctrl` + `Numpad 9` | Resize Active Window to 2800x1790, centered |




> [!note] 
> **Some of these Hotkeys might conflict Window pre-set System Hotkeys**
> 
>> ^^1 - `⊞ Win` + `C`  Might conflict with Cortana or Copliot
>>
>> ^^2 - `⊞ Win` + `G`  Might conflict with Xbox Game Bar
>
> *Personal I don't use these on my system, have shut off these system keys with [PowerToys](https://github.com/microsoft/PowerToys) Keyboard Manager.*
> *If you use them you can change them in the `.ahk` script.*
>
> ^^3 *Additionally* For decades windows Horizontal Scroll direction felt backward to me, I flipped the direction for this script.


# Notes...

- [ ] coming soon...









### Credits...

Simple AutoHotKey has been fun to learn!!
I gathered pieces of this script from several palces...

- ahk fourms
- github users
- chatgpt, haha, ugh, yup...