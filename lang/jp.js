/*!
 * timeformater.js Copyright(c) 2014 Wu Yuntao
 * https://github.com/WuYuntaoTheGreat/timeformatter
 * Released under the MIT License.
 * vim: set ai et ts=4 sw=4 cc=80 nu:
 */

(function(){
////////////////////////////////////////
// wrapped - start

var timeformater_lang_jp = {
    'M' : {
        1: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '十', '十一', '十二'],
        2: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月',
            '十一月', '十二月']
    },
    'E' : {
        1: ['日', '月', '火', '水', '木', '金', '土'],
        3: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日']
    },
    'a' : {
        1: ['午前', '午後']
    }
}

/*
 * Export the language pack.
 */
if(typeof module != 'undefined'){
    module.exports = timeformater_lang_jp;
} else {
    TimeFormatter.addResource('jp', timeformater_lang_jp);
}

// wrapped - end
////////////////////////////////////////
})();

