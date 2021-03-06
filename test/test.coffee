# 
# timeformater.js Copyright(c) 2014 Wu Yuntao
# https://github.com/WuYuntaoTheGreat/timeformatter
# Released under the MIT License.
# vim: set ai et ts=4 sw=4 cc=80 nu:
# 

assert = require "assert"

pad2 = (n) ->
    (if n < 10 then '0' else '') + n

describe "The test of timeformatter.js", ->
    describe "# Ommit Date argument", ->
        tf = require("../index")()
        now = null
        beforeEach ->
            now = new Date
        it "Year", ->
            assert.equal now.getFullYear(),  tf.format "yyyy"
        it "Month", ->
            assert.equal now.getMonth() + 1, tf.format "L"
        it "Date", ->
            assert.equal now.getDate(),      tf.format "d"
        it "Weekday", ->
            assert.equal now.getDay(),       tf.format "e"
        it "Hours", ->
            assert.equal now.getHours(),     tf.format "H"
        it "Minutes", ->
            assert.equal now.getMinutes(),   tf.format "m"
        it "Seconds", ->
            assert.equal now.getSeconds(),   tf.format "s"

    describe "# With Date argument", ->
        tf = require("../index")()
        dstr = "2013-10-12T21:55:44" + tf.localTimezoneOffset
        expc = "2013-10-12T21:55:44"
        patt = "yyyy-LL-ddTHH:mm:ss"
        it "ditto", ->
            assert.equal expc, tf.format dstr, patt


    describe "# All fields", ->
        tf = require("../index")()
        dstr = "2014-10-12T21:55:44" + tf.localTimezoneOffset
        expc = ";2014;10;12;21;9;55;44;0;p;pm;O;Oct;October;S;Sun;Sunday;"
        patt = ";yyyy;L;d;H;h;m;s;e;a;aa;M;MMM;MMMMM;E;EEE;EEEEE;"
        it "ditto", ->
            assert.equal expc, tf.format dstr, patt

    describe "# Pattern length", ->
        tf = require("../index")()
        dstr = "2014-10-09T21:55:44" + tf.localTimezoneOffset

        it "Year", ->
            assert.equal '14',          tf.format dstr, "y"
            assert.equal '14',          tf.format dstr, "yy"
            assert.equal '14',          tf.format dstr, "yyy"
            assert.equal '2014',        tf.format dstr, "yyyy"
            assert.equal '2014',        tf.format dstr, "yyyyy"
            assert.equal '2014',        tf.format dstr, "yyyyyy"
            assert.equal '2014',        tf.format dstr, "yyyyyyy"
            assert.equal '2014',        tf.format dstr, "yyyyyyyy"

        it "Month (string)", ->
            assert.equal 'O',           tf.format dstr, "M"
            assert.equal 'O',           tf.format dstr, "MM"
            assert.equal 'Oct',         tf.format dstr, "MMM"
            assert.equal 'Oct',         tf.format dstr, "MMMM"
            assert.equal 'October',     tf.format dstr, "MMMMM"
            assert.equal 'October',     tf.format dstr, "MMMMMM"
            assert.equal 'October',     tf.format dstr, "MMMMMMM"
            assert.equal 'October',     tf.format dstr, "MMMMMMMM"

        it "Month (num)", ->
            assert.equal '10',          tf.format dstr, "L"
            assert.equal '10',          tf.format dstr, "LL"
            assert.equal '010',         tf.format dstr, "LLL"
            assert.equal '0010',        tf.format dstr, "LLLL"
            assert.equal '00010',       tf.format dstr, "LLLLL"
            assert.equal '000010',      tf.format dstr, "LLLLLL"
            assert.equal '0000010',     tf.format dstr, "LLLLLLL"
            assert.equal '00000010',    tf.format dstr, "LLLLLLLL"

        it "Date", ->
            assert.equal '9',           tf.format dstr, "d"
            assert.equal '09',          tf.format dstr, "dd"
            assert.equal '009',         tf.format dstr, "ddd"
            assert.equal '0009',        tf.format dstr, "dddd"
            assert.equal '00009',       tf.format dstr, "ddddd"
            assert.equal '000009',      tf.format dstr, "dddddd"
            assert.equal '0000009',     tf.format dstr, "ddddddd"
            assert.equal '00000009',    tf.format dstr, "dddddddd"

        it "Weekday (string)", ->
            assert.equal 'T',           tf.format dstr, "E"
            assert.equal 'T',           tf.format dstr, "EE"
            assert.equal 'Thu',         tf.format dstr, "EEE"
            assert.equal 'Thu',         tf.format dstr, "EEEE"
            assert.equal 'Thursday',    tf.format dstr, "EEEEE"
            assert.equal 'Thursday',    tf.format dstr, "EEEEEE"
            assert.equal 'Thursday',    tf.format dstr, "EEEEEEE"
            assert.equal 'Thursday',    tf.format dstr, "EEEEEEEE"

        it "Weekday (string)", ->
            assert.equal 'p',           tf.format dstr, "a"
            assert.equal 'pm',          tf.format dstr, "aa"
            assert.equal 'pm',          tf.format dstr, "aaa"
            assert.equal 'pm',          tf.format dstr, "aaaa"
            assert.equal 'pm',          tf.format dstr, "aaaaa"
            assert.equal 'pm',          tf.format dstr, "aaaaaa"
            assert.equal 'pm',          tf.format dstr, "aaaaaaa"
            assert.equal 'pm',          tf.format dstr, "aaaaaaaa"

    describe "# Month names", ->
        tf = require("../index")()
        expects = [
            'Jan'
            'Feb'
            'Mar'
            'Apr'
            'May'
            'Jun'
            'Jul'
            'Aug'
            'Sep'
            'Oct'
            'Nov'
            'Dec'
        ]
        for n, i in expects
            dstr = "2010-#{pad2 i + 1}-01T00:00:00" + tf.localTimezoneOffset
            fn = (n, dstr) ->
                it n, ->
                    assert.equal n, tf.format dstr, 'MMM'
            fn(n, dstr)

    describe "# Weekday names", ->
        tf = require("../index")()
        expects = [
            'Sun'
            'Mon'
            'Tue'
            'Wed'
            'Thu'
            'Fri'
            'Sat'
        ]

        for n, i in expects
            dstr = "2014-10-#{pad2 5 + i}T00:00:00" + tf.localTimezoneOffset
            fn = (n, dstr) ->
                it n, ->
                    assert.equal n, tf.format dstr, 'EEE'
            fn(n, dstr)

    describe "# Chinese Month names", ->
        tf = require("../index")('zh')
        expects = [
            '一月'
            '二月'
            '三月'
            '四月'
            '五月'
            '六月'
            '七月'
            '八月'
            '九月'
            '十月'
            '十一月'
            '十二月'
        ]
        for n, i in expects
            dstr = "2010-#{pad2 i + 1}-01T00:00:00" + tf.localTimezoneOffset
            fn = (n, dstr) ->
                it n, ->
                    assert.equal n, tf.format dstr, 'MMM'
            fn(n, dstr)

    describe "# Chinese Weekday names", ->
        tf = require("../index")('zh')
        expects = [
            '星期天'
            '星期一'
            '星期二'
            '星期三'
            '星期四'
            '星期五'
            '星期六'
        ]

        for n, i in expects
            dstr = "2014-10-#{pad2 5 + i}T00:00:00" + tf.localTimezoneOffset
            fn = (n, dstr) ->
                it n, ->
                    assert.equal n, tf.format dstr, 'EEE'
            fn(n, dstr)

    describe "# Chinese am/pm", ->
        tf = require("../index")('zh')
        it '上午', ->
            assert.equal '上午', tf.format "2014-10-27T00:00:01", 'a'
        it '下午', ->
            assert.equal '下午', tf.format "2014-10-27T12:00:01", 'a'


    describe "# Japanese Month names", ->
        tf = require("../index")('jp')
        expects = [
            '一月'
            '二月'
            '三月'
            '四月'
            '五月'
            '六月'
            '七月'
            '八月'
            '九月'
            '十月'
            '十一月'
            '十二月'
        ]
        for n, i in expects
            dstr = "2010-#{pad2 i + 1}-01T00:00:00" + tf.localTimezoneOffset
            fn = (n, dstr) ->
                it n, ->
                    assert.equal n, tf.format dstr, 'MMM'
            fn(n, dstr)

    describe "# Japanese Weekday names", ->
        tf = require("../index")('jp')
        expects = [
            '日曜日'
            '月曜日'
            '火曜日'
            '水曜日'
            '木曜日'
            '金曜日'
            '土曜日'
        ]

        for n, i in expects
            dstr = "2014-10-#{pad2 5 + i}T00:00:00" + tf.localTimezoneOffset
            fn = (n, dstr) ->
                it n, ->
                    assert.equal n, tf.format dstr, 'EEE'
            fn(n, dstr)

    describe "# Japanese am/pm", ->
        tf = require("../index")('jp')
        it '午前', ->
            assert.equal '午前', tf.format "2014-10-27T00:00:01", 'a'
        it '午後', ->
            assert.equal '午後', tf.format "2014-10-27T12:00:01", 'a'

