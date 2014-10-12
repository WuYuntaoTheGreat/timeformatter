/*!
 * timeformater.js Copyright(c) 2014 Wu Yuntao
 * https://github.com/WuYuntaoTheGreat/timeformatter
 * Released under the MIT License.
 * vim: set ai et ts=4 sw=4 cc=80 nu:
 */

(function(){
////////////////////////////////////////
// wrapped - start

var timeformater_lang_zh = {
    'M' : {
        1: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '十', '十一', '十二'],
        2: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月',
            '十一月', '十二月']
    },
    'E' : {
        1: ['日', '一', '二', '三', '四', '五', '六'],
        3: ['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']
    },
    'a' : {
        1: ['上午', '下午']
    }
}

/*
 * Export the language pack.
 */
if(typeof module != 'undefined'){
    module.exports = timeformater_lang_zh;
} else {
    TimeFormatter.resources['zh'] = timeformater_lang_zh;
}

// wrapped - end
////////////////////////////////////////
})();

