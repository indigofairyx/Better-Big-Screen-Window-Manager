#NoEnv ; Recommended for performance and compatibility with future AHK releases.
#SingleInstance, Force
#Persistent 
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
DetectHiddenWindows, On ; Unnecessary but left just in case of future changes.
SetWinDelay, -1
#InstallKeybdHook
#InstallMouseHook
CoordMode, Mouse, Screen
SendMode Input   ; Recommended for new scripts do to its superior speed and reliability
SetTitleMatchMode, 2

;menu, tray, icon, %A_WorkingDir%\Images\MoveTo32x32.ico

; local option for icon
menu, tray, icon, C:\Windows\System32\shell32.dll, 160 ;square move symbol

;  ⊞ Win -- ⊞

; Am turning off Warnings by default.
;Uncomment this line below if the script seems to be misbehaving.
;#warn  ; Enable warning to assist with decting common errors.



;***************************************************************************
;********************** RUN AS ADMINSTORATOR *******************************
;***************************************************************************

If !A_IsAdmin
  Run *RunAs "%A_ScriptFullPath%"

;This admin prompt allows you to move\resize and control windows running in admin mode, ie.. the task manager, Microsoft's own internal config windows, disk clean up and\or program installers etc. Microsoft own windows are one of the worst at popping up in the far corner of large screen. Without Admin evaluation you cannot move windows running in admin mode with hotkeys, only via click & drag with a mouse on the title bar.



;***************************************************************************
;************************** HEADER *****************************************
;***************************************************************************


;font ascii from https://patorjk.com/software/taag/#p=display&h=3&v=2&c=c&f=Doh&t=Window%0AManager%0A
/*
 *                                                                                dddddddd                                                      
 *    WWWWWWWW                           WWWWWWWWiiii                             d######d                                                      
 *    W######W                           W######i####i                            d######d                                                      
 *    W######W                           W######Wiiii                             d######d                                                      
 *    W######W                           W######W                                 d#####d                                                       
 *     W#####W           WWWWW           W#####iiiiiinnnn  nnnnnnnn       ddddddddd#####d   ooooooooooowwwwwww           wwwww           wwwwwww
 *      W#####W         W#####W         W#####Wi#####n###nn########nn   dd##############d oo###########ow#####w         w#####w         w#####w 
 *       W#####W       W#######W       W#####W  i####n##############nn d################do###############w#####w       w#######w       w#####w  
 *        W#####W     W#########W     W#####W   i####nn###############d#######ddddd#####do#####ooooo#####ow#####w     w#########w     w#####w   
 *         W#####W   W#####W#####W   W#####W    i####i n#####nnnn#####d######d    d#####do####o     o####o w#####w   w#####w#####w   w#####w    
 *          W#####W W#####W W#####W W#####W     i####i n####n    n####d#####d     d#####do####o     o####o  w#####w w#####w w#####w w#####w     
 *           W#####W#####W   W#####W#####W      i####i n####n    n####d#####d     d#####do####o     o####o   w#####w#####w   w#####w#####w      
 *            W#########W     W#########W       i####i n####n    n####d#####d     d#####do####o     o####o    w#########w     w#########w       
 *             W#######W       W#######W       i######in####n    n####d######ddddd######do#####ooooo#####o     w#######w       w#######w        
 *              W#####W         W#####W        i######in####n    n####nd#################o###############o      w#####w         w#####w         
 *               W###W           W###W         i######in####n    n####n d#########ddd####doo###########oo        w###w           w###w          
 *                WWW             WWW          iiiiiiiinnnnnn    nnnnnn  ddddddddd   ddddd  ooooooooooo           www             www           
 *    MMMMMMMM               MMMMMMMM                                                                                                           
 *    M#######M             M#######M                                                                                                           
 *    M########M           M########M                                                                                                           
 *    M#########M         M#########M                                                                                                           
 *    M##########M       M##########M aaaaaaaaaaaaa nnnn  nnnnnnnn     aaaaaaaaaaaaa    ggggggggg   ggggg   eeeeeeeeeeee   rrrrr   rrrrrrrrr    
 *    M###########M     M###########M a############an###nn########nn   a############a  g#########ggg####g ee############ee r####rrr#########r   
 *    M#######M####M   M####M#######M aaaaaaaaa#####n##############nn  aaaaaaaaa#####ag#################ge######eeeee#####er#################r  
 *    M######M M####M M####M M######M          a####nn###############n          a####g######ggggg######ge######e     e#####rr######rrrrr######r 
 *    M######M  M####M####M  M######M   aaaaaaa#####a n#####nnnn#####n   aaaaaaa#####g#####g     g#####ge#######eeeee######er#####r     r#####r 
 *    M######M   M#######M   M######M aa############a n####n    n####n aa############g#####g     g#####ge#################e r#####r     rrrrrrr 
 *    M######M    M#####M    M######Ma####aaaa######a n####n    n####na####aaaa######g#####g     g#####ge######eeeeeeeeeee  r#####r             
 *    M######M     MMMMM     M######a####a    a#####a n####n    n####a####a    a#####g######g    g#####ge#######e           r#####r             
 *    M######M               M######a####a    a#####a n####n    n####a####a    a#####g#######ggggg#####ge########e          r#####r             
 *    M######M               M######a#####aaaa######a n####n    n####a#####aaaa######ag################g e########eeeeeeee  r#####r             
 *    M######M               M######Ma##########aa###an####n    n####na##########aa###agg##############g  ee#############e  r#####r             
 *    MMMMMMMM               MMMMMMMM aaaaaaaaaa  aaaannnnnn    nnnnnn aaaaaaaaaa  aaaa  gggggggg######g    eeeeeeeeeeeeee  rrrrrrr             
 *                                                                                               g#####g                                        
 *                                                                                   gggggg      g#####g                                        
 *                                                                                   g#####gg   gg#####g                                        
 *                                                                                    g######ggg#######g                                        
 *                                                                                     gg#############g                                         
 *                                                                                       ggg######ggg                                           
 *                                                                                          gggggg                                              
 */
 
 
;***************************************************************************
;************************* CenterActiveWindow ******************************
;***************************************************************************

#C::CenterActiveWindow() ;Center active Window ;NOTE! Might conflict with Cortana
	CenterActiveWindow() {
    ; Get the handle of the active window
    WinGet, ActiveWindow, ID, A
    ; Get the position and size of the active window
    WinGetPos, WinX, WinY, WinWidth, WinHeight, ahk_id %ActiveWindow%
    ; Get the working area width and height (excluding the taskbar)
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    ; Calculate the new position to center the window
    NewX := (MonitorWorkAreaRight - MonitorWorkAreaLeft - WinWidth) // 2 + MonitorWorkAreaLeft
    NewY := (MonitorWorkAreaBottom - MonitorWorkAreaTop - WinHeight) // 2 + MonitorWorkAreaTop
    ; Move the active window to the center of the screen
    WinMove, ahk_id %ActiveWindow%, , %NewX%, %NewY%
}

 
;***************************************************************************
;**************************** MOUSE WHEEL FUNCTIONS ************************
;***************************************************************************

#^WheelUp::IncreaseWindowSize() ;increase\grow window size
#^WheelDown::ShrinkWindowSize() ;decrease\shrink window size

;***************************************************************************
;****** Change System Volume with Windows Key and the Mouse Wheel **********
;***************************************************************************

#!WheelUp::Send {Volume_Up} ;Win + Wheel Up -- Volume up
#!WheelDown::Send {Volume_Down} ;Win + Wheel Down -- Volume down

;***************************************************************************
;************************* MIDDLE MOUSE BUTTON ;****************************
;***************************************************************************

#MButton:: ;send window to back\bottom
    WinGet, clickedWindow, ID, A ; Get the ID of the clicked window
    WinSet, Bottom, , ahk_id %clickedWindow% ; Send the window to the bottom
    Send, !{Esc} ; Send Alt+Esc to the active window
return

;***************************************************************************
;******************** MOVE WINDOW WITH MOUSE WHEEL *************************
;***************************************************************************

#WheelUp::MoveWindow(0, -100) ; Move window UP
#WheelDown::MoveWindow(0, 100) ; Move window DOWN
#WheelLeft::MoveWindow(200, 0) ; Move window RIGHT
#WheelRight::MoveWindow(-200, 0) ; Move window LEFT

;***************************************************************************
;***************** grab\move\bring active window to mouse ******************
;***************************************************************************

#g:: ;grab\move\bring active window to mouse >NOTE! Might conflith with Xbox Game Bar
CoordMode, Mouse, Screen
MouseGetPos, x, y
WinMove A, , %x%, %y%
return

;***************************************************************************
;********************* restore window from fullscreen **********************
;***************************************************************************

#^r:: ;restore window from fullscreen
WinRestore, A, , ,
return

#numpad0:: ;restore window from fullscreen
WinRestore, A, , ,
return

;***************************************************************************
;********************* Minimzie All Except Acive Window ********************
;***************************************************************************

#NumpadDiv::
    WinGet, active_id, ID, A  ; Get the active window ID.
    WinMinimizeAll  ; Minimize all windows.
    WinRestore, ahk_id %active_id%  ; Restore the active window.
return

;***************************************************************************
;************************* active window resizing **************************
;***************************************************************************

#PgUp::IncreaseWindowSize() ;increase\grow window size  
#PgDn::ShrinkWindowSize() ;decrease\shrink window size
; "MOUSE WHEEL FUCNTIONS" MOVE TO TOP ^^^ LINES UP HERE
IncreaseWindowSize() {
    ; Get the handle of the active window
    WinGet, ActiveWindow, ID, A

    ; Get the position and size of the active window
    WinGetPos, WinX, WinY, WinWidth, WinHeight, ahk_id %ActiveWindow%

    ; Calculate the new width and height
    ;NewWidth := WinWidth + 50
    NewWidth := WinWidth + 100
	NewHeight := WinHeight + 50
	

    ; Calculate the new position to keep the window centered
    NewX := WinX - (NewWidth - WinWidth) // 2
    NewY := WinY - (NewHeight - WinHeight) // 2

    ; Move and resize the window
    WinMove, ahk_id %ActiveWindow%, , %NewX%, %NewY%, %NewWidth%, %NewHeight%
}

ShrinkWindowSize() {
    ; Get the handle of the active window
    WinGet, ActiveWindow, ID, A

    ; Get the position and size of the active window
    WinGetPos, WinX, WinY, WinWidth, WinHeight, ahk_id %ActiveWindow%

    ; Calculate the new width and height (ensure they don't go below 0)
    ;NewWidth := Max(WinWidth - 50, 0)
	NewWidth := Max(WinWidth - 100, 0)
    NewHeight := Max(WinHeight - 50, 0)
	

    ; Calculate the new position to keep the window centered
    NewX := WinX + ((WinWidth - NewWidth) // 2)
    NewY := WinY + ((WinHeight - NewHeight) // 2)

    ; Move and resize the window
    WinMove, ahk_id %ActiveWindow%, , %NewX%, %NewY%, %NewWidth%, %NewHeight%
}

Max(a, b) {
    return a > b ? a : b
}

;***************************************************************************
;******************* Move Moving Window With Numpad Keys *******************
;***************************************************************************

#numpad8::MoveWindow(0, -100) ; Move window UP
#numpad2::MoveWindow(0, 100) ; Move window DOWN
#numpad4::MoveWindow(-200, 0) ; Move window LEFT
#numpad6::MoveWindow(200, 0) ; Move window RIGHT
#Numpad1::MoveWindow(-200, 100) ; Movie window DOWN & LEFT
#Numpad3::MoveWindow(200, 100) ; Movie window DOWN & RIGHT
#Numpad7::MoveWindow(-200, -100) ; Movie window UP & LEFT
#Numpad9::MoveWindow(200, -100) ; Movie window DOWN & RIGHT

MoveWindow(dx, dy) {
    ; Get the handle of the active window
    WinGet, ActiveWindow, ID, A

    ; Get the position and size of the active window
    WinGetPos, WinX, WinY, WinWidth, WinHeight, ahk_id %ActiveWindow%

    ; Get the dimensions of the primary monitor
    SysGet, Monitor, MonitorWorkArea

    ; Calculate the new position
    NewX := WinX + dx
    NewY := WinY + dy

    ; Ensure the window stays within the bounds of the primary monitor
    NewX := Max(MonitorLeft, Min(NewX, MonitorRight - WinWidth))
    NewY := Max(MonitorTop, Min(NewY, MonitorBottom - WinHeight))

    ; Move the window
    WinMove, ahk_id %ActiveWindow%, , %NewX%, %NewY%
}

;***************************************************************************
;************************* SNAP WINDOWS TO CORNERS *************************
;***************************************************************************

#!Numpad7::SnapToScreen1() ;dock/snap window top-left
#!Numpad9::SnapToScreen2() ;dock/snap window top-right
#!Numpad1::SnapToScreen3() ;dock/snap window bottom-left
#!Numpad3::SnapToScreen4() ;dock/snap window bottom-right

#!Numpad5::CenterActiveWindow() ;center window
#Numpad5::CenterActiveWindow() ;center window
;#C::CenterActiveWindow() ;center window > NOTE! this Hotkey might conflit with Cortana

GetDPIScale() {
    ; Use DllCall to get the DPI scaling factor
    hDC := DllCall("GetDC", "Ptr", 0)
    dpi := DllCall("GetDeviceCaps", "Ptr", hDC, "Int", 88) ; 88 = LOGPIXELSX
    DllCall("ReleaseDC", "Ptr", 0, "Ptr", hDC)
    return dpi / 96.0
}

SnapToScreen1() {
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    MoveActiveWindowToCoordinates(MonitorWorkAreaLeft, MonitorWorkAreaTop, (MonitorWorkAreaRight - MonitorWorkAreaLeft) / 2, (MonitorWorkAreaBottom - MonitorWorkAreaTop) / 2)
}

SnapToScreen2() {
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    MoveActiveWindowToCoordinates((MonitorWorkAreaRight + MonitorWorkAreaLeft) / 2, MonitorWorkAreaTop, (MonitorWorkAreaRight - MonitorWorkAreaLeft) / 2, (MonitorWorkAreaBottom - MonitorWorkAreaTop) / 2)
}

SnapToScreen3() {
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    MoveActiveWindowToCoordinates(MonitorWorkAreaLeft, (MonitorWorkAreaBottom + MonitorWorkAreaTop) / 2, (MonitorWorkAreaRight - MonitorWorkAreaLeft) / 2, (MonitorWorkAreaBottom - MonitorWorkAreaTop) / 2)
}

SnapToScreen4() {
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    MoveActiveWindowToCoordinates((MonitorWorkAreaRight + MonitorWorkAreaLeft) / 2, (MonitorWorkAreaBottom + MonitorWorkAreaTop) / 2, (MonitorWorkAreaRight - MonitorWorkAreaLeft) / 2, (MonitorWorkAreaBottom - MonitorWorkAreaTop) / 2)
}
/*
CenterActiveWindow() {
    ; Get the handle of the active window
    WinGet, ActiveWindow, ID, A
    ; Get the position and size of the active window
    WinGetPos, WinX, WinY, WinWidth, WinHeight, ahk_id %ActiveWindow%
    ; Get the working area width and height (excluding the taskbar)
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    ; Calculate the new position to center the window
    NewX := (MonitorWorkAreaRight - MonitorWorkAreaLeft - WinWidth) // 2 + MonitorWorkAreaLeft
    NewY := (MonitorWorkAreaBottom - MonitorWorkAreaTop - WinHeight) // 2 + MonitorWorkAreaTop
    ; Move the active window to the center of the screen
    WinMove, ahk_id %ActiveWindow%, , %NewX%, %NewY%
}
*/
MoveActiveWindowToCoordinates(x, y, w, h) {
    ; Get the handle of the active window
    WinGet, ActiveWindow, ID, A
    ; Move the active window to the specified screen coordinates
    WinMove, ahk_id %ActiveWindow%, , %x%, %y%, %w%, %h%
}

;***************************************************************************
;************************* SNAP WINDOW TO HALF SCREEN **********************
;***************************************************************************

#!Numpad2:: ; Snap bottom half of the screen
    SnapToBottomHalf()
return

#!Numpad4:: ; Snap left half of the screen
    SnapToLeftHalf()
return

#!Numpad6:: ; Snap right half of the screen
    SnapToRightHalf()
return

#!Numpad8:: ; Snap top half of the screen
    SnapToTopHalf()
return

SnapToBottomHalf() {
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    MoveActiveWindowToCoordinates(MonitorWorkAreaLeft, (MonitorWorkAreaBottom + MonitorWorkAreaTop) / 2, MonitorWorkAreaRight - MonitorWorkAreaLeft, (MonitorWorkAreaBottom - MonitorWorkAreaTop) / 2)
}

SnapToLeftHalf() {
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    MoveActiveWindowToCoordinates(MonitorWorkAreaLeft, MonitorWorkAreaTop, (MonitorWorkAreaRight - MonitorWorkAreaLeft) / 2, MonitorWorkAreaBottom - MonitorWorkAreaTop)
}

SnapToRightHalf() {
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    MoveActiveWindowToCoordinates((MonitorWorkAreaRight + MonitorWorkAreaLeft) / 2, MonitorWorkAreaTop, (MonitorWorkAreaRight - MonitorWorkAreaLeft) / 2, MonitorWorkAreaBottom - MonitorWorkAreaTop)
}

SnapToTopHalf() {
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    MoveActiveWindowToCoordinates(MonitorWorkAreaLeft, MonitorWorkAreaTop, MonitorWorkAreaRight - MonitorWorkAreaLeft, (MonitorWorkAreaBottom - MonitorWorkAreaTop) / 2)
}

;***************************************************************************
;********************** Quick Window Resize & Center ***********************
;***************************************************************************

ResizeAndCenterActiveWindow(width, height) {
    ; Get the handle of the active window
    WinGet, ActiveWindow, ID, A

    ; Get the position and size of the active window
    WinGetPos, WinX, WinY, WinWidth, WinHeight, ahk_id %ActiveWindow%

    ; Get the working area width and height (excluding the taskbar)
    SysGet, MonitorWorkArea, MonitorWorkArea, 1

    ; Calculate the new position to center the window
    NewX := (MonitorWorkAreaRight - MonitorWorkAreaLeft - WinWidth) // 2 + MonitorWorkAreaLeft
    NewY := (MonitorWorkAreaBottom - MonitorWorkAreaTop - WinHeight) // 2 + MonitorWorkAreaTop

    ; Move the active window to the center of the screen
    WinMove, ahk_id %ActiveWindow%, , %NewX%, %NewY%
}

#^NumPad0:: ;Resize Active Window to 700x400 and center
	WinRestore, A
	WinMove, A, , , , 700, 400
    ResizeAndCenterActiveWindow(700, 400)
return

#^NumPad1:: ;Resize Active Window to 800x600 and center
	WinRestore, A
	WinMove, A, , , , 800, 600
    ResizeAndCenterActiveWindow(800, 600)
return

#^NumPad2:: ;Resize Active Window to 1080x720 and center
	WinRestore, A
	WinMove, A, , , , 1080, 720
    ResizeAndCenterActiveWindow(1080, 720)
return

#^NumPad3:: ;Resize Active Window to 1224x800 and center
	WinRestore, A
	WinMove, A, , , , 1224, 800
    ResizeAndCenterActiveWindow(1224, 800)
return

#^NumPad4:: ;Resize Active Window to 1280x850 and center
	WinRestore, A
	WinMove, A, , , , 1280, 850
    ResizeAndCenterActiveWindow(1280, 850)
return

#^NumPad5:: ;Resize Active Window to 1440x900 and center
	WinRestore, A
	WinMove, A, , , , 1440, 900
    ResizeAndCenterActiveWindow(1440, 900)
return

#^NumPad6:: ;Resize Active Window to 1600x1000 and center
	WinRestore, A
	WinMove, A, , , , 1600, 1000
    ResizeAndCenterActiveWindow(1600, 1000)
return

#^NumPad7:: ;Resize Active Window to 1920x1080 and center
	WinRestore, A
	WinMove, A, , , , 1920, 1080
    ResizeAndCenterActiveWindow(1920, 1080)
return

#^NumPad8:: ;Resize Active Window to 2430x1370 and center
	WinRestore, A
	WinMove, A, , , , 2430,	1370
    ResizeAndCenterActiveWindow(2430, 1370)
return

#^NumPad9:: ;Resize Active Window to 2800x1790 and center
	WinRestore, A
	WinMove, A, , , , 2800, 1790
    ResizeAndCenterActiveWindow(2800, 1790)
return

;***************************************************************************
;**************************** Extra Resize Keys ****************************
;***************************************************************************

#Z:: ;Resize Active Window to 1920x1080 and center
	WinRestore, A
	WinMove, A, , , , 1920, 1080
    ResizeAndCenterActiveWindow(1920, 1080)
return

#!Z:: ;Resize Active Window to 1280x850 and center
	WinRestore, A
	WinMove, A, , , , 1280, 720
    ResizeAndCenterActiveWindow(1280, 720)
return


;***************************************************************************
;************************* Big Centered Lowerd Window **********************
;***************************************************************************

#^b:: ;Rezied Active Window to 2953x1726, centred & Lowered to task bar
	WinRestore, A
	WinMove, A, , 455, 388, 2953, 1726
return


;***************************************************************************
;************************* 1 or 2 WINDOW MOVING\DRAGGING *******************
;***************************************************************************

;Source: https://juho-lee.com/archive
#LButton:: ;Holding Win, Click & Drag with Left Mouse button to MOVE a Window
MouseGetPos, Mouse_Start_X, Mouse_Start_Y, Selected_Window
WinGet, Window_State, MinMax, ahk_id %Selected_Window%
if Window_State = 0
    SetTimer, MyLabel, 1
return

MyLabel:
MouseGetPos, Mouse_Current_X, Mouse_Current_Y
WinGetPos, Selected_Window_X, Selected_Window_Y, , , ahk_id %Selected_Window%
WinMove, ahk_id %Selected_Window%, , Selected_Window_X + Mouse_Current_X - Mouse_Start_X, Selected_Window_Y + Mouse_Current_Y - Mouse_Start_Y

Mouse_Start_X := Mouse_Current_X
Mouse_Start_Y := Mouse_Current_Y

GetKeyState, LButton_State, LButton, P
if LButton_State = U
{
    SetTimer, MyLabel, off
    return
}
return

;****************************************************************************
;************************* 2 OF 2 WINDOW RE-SIZING **************************
;****************************************************************************

;sourced from https://gist.github.com/Elijas/49b83ade78674d80cf6cbf711455f75c
;there were more hotkey function in the original script. which i edited out, simple is more.
;weeks later i noticed he just copied & pasted this from the ahks forums, https://www.autohotkey.com

#RButton:: ;Holding WIN, Click & Drag with Right Mouse button to RESIZE a Window
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; Get the initial window position and size.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
; Define the window region the mouse is currently in.
; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
   KDE_WinLeft := 1
Else
   KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
   KDE_WinUp := 1
Else
   KDE_WinUp := -1
Loop
{
    GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    ; Get the current window position and size.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    ; Then, act according to the defined region.
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
    KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
return

;***************************************************************************
;************************** QUICK CLOSE! ***********************************
;***************************************************************************

~Esc::  ;double tap ESC to close\send-F4 to the Active Window
WinGet, idOld, ID, A
KeyWait, Esc
KeyWait, Esc, D, T0.4
if (ErrorLevel == 0)
{
WinGet, idNew, ID, A
WinGetClass, class, A
if (idOld == idNew && class != "Shell_TrayWnd" && class != "Progman" && class != "WorkerW")
{
Send !{F4}
}
}



^+Numpadsub::Reload ;Reload Window Manager Script
^!#esc::exitapp ;Exit Window Manager Script

;***************************************************************************
;******************************* END ***************************************
;***************************************************************************



;***************************************************************************
;***************************************************************************
;***************************************************************************

/*
QUICK HOTKEY CHEATSHEET


SCRIPT CONTROL
Ctrl + Shift + Numpad - to Reload Window Manager Script
Ctrl + Alt + ⊞ Win + ESC to Exit Window Manager Script

MOUSE FUNCTIONS  
⊞ Win + Middle Mouse Button to Send window to back\bottom
⊞ Win + Wheel Up to Move window Up
⊞ Win + Wheel Down to Move window Down
⊞ Win + Wheel Left to Move Window Right $ 3
⊞ Win + Wheel Right to Move Window Left $ 3
⊞ Win + Alt + Wheel Down to System Volume Down
⊞ Win + Alt + Wheel Up to System Volume Up
⊞ Win + Ctrl + Wheel Down to Decrease\Shrink window size
⊞ Win + Ctrl + Wheel Up to Increase\Grow window size
CLICK & DRAG
⊞ Win + Right Button to Holding ⊞ Win, Click & Drag with Right Mouse button to RESIZE a Window
⊞ Win + Left Button to Holding ⊞ Win, Click & Drag with Left Mouse button to MOVE a Window

HOTKEYS 
FAST HOTKEYS
~ //Double Tap ESC to Double tap ESC to close the acive window -- {send-F4}
⊞ Win + C to Center active Window  $ 1
⊞ Win + G to Grab\Move\Bring active window to mouse pointer, works great for small windows $ 2
⊞ Win + Alt + Z to Resize Active Window to 1280x850 and center
⊞ Win + Z to Resize Active Window to 1920x1080 and center
⊞ Win + Ctrl + B to Rezied Active Window to 2953x1726, Centred & Lowered to taskbar
⊞ Win + Ctrl + R to Restore window from fullscreen
⊞ Win + Page Down to Decrease\Shrink window size
⊞ Win + Page Up to Increase\Grow window size

NUMPAD HOTKEYS 
MOVE ACTIVE WINDOW
⊞ Win + Numpad 1 to Movie window DOWN & LEFT
⊞ Win + Numpad 2 to Move window DOWN
⊞ Win + Numpad 3 to Movie window DOWN & RIGHT
⊞ Win + Numpad 4 to Move window LEFT
⊞ Win + Numpad 5 to Center window
⊞ Win + Numpad 6 to Move window RIGHT
⊞ Win + Numpad 7 to Movie window UP & LEFT
⊞ Win + Numpad 8 to Move window UP
⊞ Win + Numpad 9 to Movie window DOWN & RIGHT
⊞ Win + Numpad 0 to Restore window from fullscreen

QUICK ACTIVE WINDOW RESIZING
⊞ Win + Ctrl + Numpad 0 to Resize Active Window to 700x400, centered
⊞ Win + Ctrl + Numpad 1 to Resize Active Window to 800x600, centered
⊞ Win + Ctrl + Numpad 2 to Resize Active Window to 1080x720, centered
⊞ Win + Ctrl + Numpad 3 to Resize Active Window to 1224x800, centered
⊞ Win + Ctrl + Numpad 4 to Resize Active Window to 1280x850, centered
⊞ Win + Ctrl + Numpad 5 to Resize Active Window to 1440x900, centered
⊞ Win + Ctrl + Numpad 6 to Resize Active Window to 1600x1000, centered
⊞ Win + Ctrl + Numpad 7 to Resize Active Window to 1920x1080, centered
⊞ Win + Ctrl + Numpad 8 to Resize Active Window to 2430x1370, centered
⊞ Win + Ctrl + Numpad 9 to Resize Active Window to 2800x1790, centered

QUICK WINDOW DOCKING\SNAPPING
⊞ Win + Alt + Numpad 1 to Dock\Snap window bottom-left
⊞ Win + Alt + Numpad 2 to Snap bottom half of the screen
⊞ Win + Alt + Numpad 3 to Dock\Snap window bottom-right
⊞ Win + Alt + Numpad 4 to Snap left half of the screen
⊞ Win + Alt + Numpad 5 to Center window
⊞ Win + Alt + Numpad 6 to Snap right half of the screen
⊞ Win + Alt + Numpad 7 to Dock\Snap window top-left
⊞ Win + Alt + Numpad 8 to Snap top half of the screen
⊞ Win + Alt + Numpad 9 to Dock\Snap window top-right
*/




















