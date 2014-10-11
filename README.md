    ____________
    \__    ____/          ______________
      |    |__            \_   ________/                 __   __                  
      |    |__| _____  ____|    __)_________ _____ _____/  |_/  |_ ___________   
      |    |  |/     \/ __ \    \  _ \_  __ \     \\__  \  __\  __\ __ \_  __ \  
      |____|  |  Y Y  \ ___/__  / <_> )  | \/ Y Y  \/ __ \ | |  |\  ___/|  | \/
           |__|__|_|  /___  > \/\____/|__| |__|_|  (___  /_| |__| \___  >__|   
                    \/    \/                     \/    \/             \/       

timeformatter.js
================

This is a utility module to provide Javascript programs the ability of
formatting date time using pattern.

Installation
============

Usage
=====

Arguments
---------

*timeformatter(date, pattern)*

### date
* A Javascript Date object should be used.
* If this argument is a String instance, it will be converted to Javascript
  Date object, using its constructor.
* If ommitted, the current time will be used.

### pattern
The pattern will be used to format the date time.
For detailed reference of pattern symbols, please read following section.

Pattern Reference
-----------------

symbol	description                         example
~~~~~~  ~~~~~~~~~~~                         ~~~~~~~
y	Year                                14, 2014
M	Month of year                       J, Jul, July
L       Month number of year                7, 07
d	Day of Month                        3, 03
E	Day of week                         S, Sun, Sunday
e       Day number of week (Sunday is 0)    0, 00

H	Hour of day (24 hours)              21
h	Hour of day (12 hours)              9
a	AM/PM off day                       a, am
m	Minutes                             7, 07
s	Seconds                             5, 05


License
=======

MIT (http://www.opensource.org/licenses/mit-license.php)

