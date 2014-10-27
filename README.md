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

Use [npm](www.npmjs.org) to install timeformatter.js:

    npm install timeformatter

Usage
=====

Node.js
-------

    var tf = require('timeformatter')('zh');
    ...
    console.log(tf.format('yyyy/LL/dd'));

The argument 'lang' specifies which language will be used to format the time.
If ommitted, the language 'English' will be used.

*Currently, only 'en' and 'zh' language packs are supported.*

Browser
-------

    <script src='path-to-timeformatter-root/lib/timeformatter.js'></script>
    <script>
        var tf = new TimeFormatter(); 
        console.log(tf.format('yyyy/LL/dd'));
    </script>

Browser can also use language packs, but will need to be included separately:

    <script src='path-to-timeformatter-root/lib/timeformatter.js'></script>
    <script src='path-to-timeformatter-root/lang/zh.js'></script>
    <script>
        var tf = new TimeFormatter('zh'); 
        console.log(tf.format('yyyy/LL/dd'));
    </script>

NOTE: language pack AFTER main script.

Arguments
---------

Following code snippet shows how to use timeformatter:

    tf.format(date, pattern);

For example

    tf.format("yyyy/L/d EEE"); // Will yield something like "2014/10/12 Sun"
    tf.format(new Date(), "yyyy/L/d EEE"); // Same as above

### date
* A Javascript Date object should be used.
* If ommitted, the current time will be used.
* If this argument is a String instance, it will be converted to Javascript
  Date object, using its constructor. 

  **Be Very Careful!** Some environments (especially in Node.js), Javascript
  will consider your inputed string an 'UTC' time, and the nature of Date
  object only yield date time value of your local timezone. See, if you are in
  China, which is in timezone '+08:00', following code will not work as you
  expected:
  
      tf.format('2014-10-12T23:55:55', 'yyyy-LL-ddTHH:mm:ss');
          // You may expect the same string as the first argument,
          // but you got '2014-10-13T07:55:55' instead;
          // because the system treat your input as 'UTC' time, but output
          // it as your local time, which is 8 hours ahead of .

  To solve this problem, you can use the timeformatter's *localTimezoneOffset*
  property, and append it to the end of your input string. This property will
  look like: '+08:00'. So, the following code will be correct.
  
      tf.format('2014-10-12T23:55:55' + tf.localTimezoneOffset,
              'yyyy-LL-ddTHH:mm:ss'); // You got exactly what you want.
    

### pattern
The pattern will be used to format the date time.
For detailed reference of pattern symbols, please read following section.

**Pattern Reference**

    symbol  description                         example
    ~~~~~~  ~~~~~~~~~~~                         ~~~~~~~
    y       Year                                14, 2014
    M       Month of year                       J, Jul, July
    L       Month number of year                7, 07
    d       Day of Month                        3, 03
    E       Day of week                         S, Sun, Sunday
    e       Day number of week (Sunday is 0)    0, 00

    H       Hour of day (24 hours)              21
    h       Hour of day (12 hours)              9
    a       AM/PM off day                       a, am
    m       Minutes                             7, 07
    s       Seconds                             5, 05

Language Pack
=============

This version includes only English (no extra include file needed) and Chinese,
Japanese (need to include './lang/zh.js' and './lang/jp.js'). If you wish to 
support your local language, it can be done easily by create a new language
pack script.  

Following is an example:


    (function(){

    var timeformater_lang_en = {
        'M' : {
            1: ['J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'],
            3: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep',
                'Oct', 'Nov', 'Dec'],
            5: ['January', 'February', 'March', 'April', 'May', 'June', 'July',
                'August', 'September', 'October', 'November', 'December']
        },
        'E' : {
            1: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
            3: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
            5: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
                'Friday', 'Saturday']
        },
        'a' : {
            1: ['a', 'p'],
            2: ['am', 'pm']
        }
    }

    /*
     * Export the language pack.
     */
    if(typeof module != 'undefined'){
        module.exports = timeformater_lang_en;
    } else {
        TimeFormatter.addResources('en', timeformater_lang_en);
    }

    })();


The main part of each language pack is a hash map (associative array), keyed by
time format pattern symbols ('M' for month names, 'E' for day of week, 'a' for
AM/PM). Each item of the hash map is, again, a hash map, keyed by numbers; the
numbers designate MINIMUM length of repeated symbols.

For example, if it's January, according to the script above,

Pattern 'M' will show 'J', and 'MM' will also show 'J', because it's 2
repeated 'M' symbols, and 2 is greater than first key '1', and smaller than the
seconde key '3'.

Pattern 'MMM' and 'MMMM' will  show 'Jan', and 'MMMMM', 'MMMMMMMMMM' will show
'January'.


License
=======

MIT (http://www.opensource.org/licenses/mit-license.php)

