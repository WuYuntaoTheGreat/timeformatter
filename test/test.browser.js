// vim: set ai et nu ts=4 sw=4 cc=100: 
$(function(){
// wrapper
var tf1  = new TimeFormatter('en') 
  , tf2  = new TimeFormatter('zh')
  , tf3  = new TimeFormatter('jp')
  , dstr = "2014-10-12T21:55:44" + tf1.localTimezoneOffset
  , patt = ";yyyy;L;d;H;h;m;s;e;a;aa;M;MMM;MMMMM;E;EEE;EEEEE;"
  , expc1= ";2014;10;12;21;9;55;44;0;p;pm;O;Oct;October;S;Sun;Sunday;"
  , expc2= ";2014;10;12;21;9;55;44;0;下午;下午;十;十月;十月;日;星期天;星期天;"
  , expc3= ";2014;10;12;21;9;55;44;0;午後;午後;十;十月;十月;日;日曜日;日曜日;"
  ;

QUnit.test("Test all symbols", function( assert ){
    assert.equal(expc1, tf1.format(dstr, patt));
    assert.equal(expc2, tf2.format(dstr, patt));
    assert.equal(expc3, tf3.format(dstr, patt));
});

// wrapper end.
});
