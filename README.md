# Lattice ispMach Breakout Board with dumb LCD

Here is an example how to connect dumb LCD display (without microcontroller)
to [ispMACH 4256ZE Breakout Board][]

> NOTE: If you have [ispMACH 4000ZE Pico Development Kit][] then you don't need this
> project - there is already connected LCD with working example.

If you never worked with [ispMACH 4256ZE Breakout Board][] I strongly
recommend to follow my Wiki articles:

* [Getting started with ispMACH 4256ZE Breakout Board][] 
* [Adding RESET button to ispMACH 4256ZE Breakout Board][]

> PROJECT STATUS:
>
> No project files yet.

# Hardware Requirements

* Having working [ispMACH 4256ZE Breakout Board]
* Added Power-Up RESET connected to PIN 72
  as described on [Adding RESET button to ispMACH 4256ZE Breakout Board][] 
* Having dumb LCD display to connect to Breakout Board 
  TODO: schematic pending 

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
* TODO:  



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