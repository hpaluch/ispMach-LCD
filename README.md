# Lattice ispMach Breakout Board with dumb LCD

Here is an example how to connect dumb LCD display (without microcontroller)
to [ispMACH 4256ZE Breakout Board][]

![ispMach with LCD](https://github.com/hpaluch/ispMach-LCD/blob/master/images/ispmach-bb-w-lcd.jpg?raw=true)

Current schematics:

![ispMach with LCD Schematics](https://github.com/hpaluch/ispMach-LCD/blob/master/schematic/latt_lcd.png?raw=true)


> NOTE: If you have [ispMACH 4000ZE Pico Development Kit][] then you don't need this
> project - there is already connected LCD with working example.

If you never worked with [ispMACH 4256ZE Breakout Board][] I strongly
recommend to follow my Wiki articles:

* [Getting started with ispMACH 4256ZE Breakout Board][] 
* [Adding RESET button to ispMACH 4256ZE Breakout Board][]

> PROJECT STATUS:
> Reached [m4-all-digits](https://github.com/hpaluch/ispMach-LCD/releases/tag/m4-all-digits):
> * all digits connected
>
> Reached [m3-1dg-counter](https://github.com/hpaluch/ispMach-LCD/releases/tag/m3-1dg-counter):
> * first working version - single digit on LCD
>
> Reached [m2-dec-counter](https://github.com/hpaluch/ispMach-LCD/releases/tag/m2-dec-counter):
> * imported clock base from Pico Dev Board
> * decimal counter module
> * debug counter output to LED D5-D8
>
> Reached [m1-reset-leds](https://github.com/hpaluch/ispMach-LCD/releases/tag/m1-reset-leds):
> * working RESET input and LED D1 & D2
> * assigned all onboard LEDs D1 - D8 to pins


Current project report available at: https://hpaluch.github.io/ispMach-LCD/

# Hardware Requirements

* Having working [ispMACH 4256ZE Breakout Board]
* Added Power-Up RESET connected to PIN 72
  as described on [Adding RESET button to ispMACH 4256ZE Breakout Board][] 
* Having dumb LCD display - used [LCD3906](http://richardstary.wz.cz/fel/10/scs/sem/LCD3902.pdf)
  (known as [4DS323 ????](http://teslakatalog.cz/4DS323A.html) in late '80 socialism era) 
  to connect to Breakout Board     

# Software Requirements

Mandatory:
* Windows OS, tested Windows 7, 64-bit, under Oracle VirtualBox
* Working installation of [ispLEVER Classic 2.0 Base Module] to
  synthetize (build) this project
* Working installation of ispVM to program your
  CPLD - [ispVM System 17.9 for Windows][] tested (even under VirtualBox)
 

Optional:
* [Git for Windows] to checkout this project 
* ExpressSCH to read `*.sch` schematic files - part
  of [ExpressPCB][] package, tested version 6.1.4 2008 

# Building project

Create directory for projects:

```cmd
md c:\projects
```

For Git checkout run _Git Bash_ and then:
```shell
cd /c/projects
git clone https://github.com/hpaluch/ispMach-LCD.git
```

Then in Explorer:
* Double-click on `c:\projects\ispMach-LCD\project\bb_lcd.syn` to open
  this project in ispLever
* Double-click _Fit Design_ in process Window
* target `bb_lcd.jed` should be rebuild

# Programming project

> WARNING!
>
> _ispVM 17.9_ uses absolute path inside of `bb_prog.xcf` so
> this file would work only if specified in the path bellow!

* Double-click on provided
  file `c:\projects\ispMach-LCD\project\bb_prog.xcf` to open _ispVM_
* issue `Ctrl`+`G` to reprogramm your device.   


[ispMACH 4256ZE Breakout Board]: http://www.latticesemi.com/Products/DevelopmentBoardsAndKits/ispMACH4256ZEBreakoutBoard.aspx
   "ispMACH 4256ZE Breakout Board"

[ispMACH 4000ZE Pico Development Kit]: http://www.latticesemi.com/en/Products/DevelopmentBoardsAndKits/ispMACH4000ZEPicoDevelopmentKit.aspx
   "ispMACH 4000ZE Pico Development Kit"

[Getting started with ispMACH 4256ZE Breakout Board]: https://github.com/hpaluch/hpaluch.github.io/wiki/Getting-started-with-ispMACH-4256ZE-Breakout-Board
   "Getting started with ispMACH 4256ZE Breakout Board" 
   
[Adding RESET button to ispMACH 4256ZE Breakout Board]: https://github.com/hpaluch/hpaluch.github.io/wiki/Adding-RESET-button-to-ispMACH-4256ZE-Breakout-Board
   "Adding RESET button to ispMACH 4256ZE Breakout Board"

[ispVM System 17.9 for Windows]: http://www.latticesemi.com/view_document?document_id=8129
   "ispVM System 17.9 for Windows"
   
[ispLEVER Classic 2.0 Base Module]: http://www.latticesemi.com/view_document?document_id=51098   
   "ispLEVER Classic 2.0 Base Module"
   
[ExpressPCB]: https://www.expresspcb.com/expresspcb/
   "ExpressPCB"
   
[Git for Windows]: https://git-scm.com/download/win
   "Git for Windows"      