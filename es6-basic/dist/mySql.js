"use strict";

/**
 * js操作mysql
 */
// 引入第三方依赖（先npm i mysql)
var mysql = require('mysql');

// 1.创建一个mysql的connection对象，并配置连接
var connection = mysql.createConnection({
    host: "127.0.0.1",
    port: 3306,
    user: "root",
    password: "123456",
    database: "test"
});
// 2.开辟连接
connection.connect();
// 3.crud
connection.query("select * from article", function (error, result, fields) {
    if (error) {
        throw error;
    }
    console.log("result=", result);
});
// 4.关闭连接
connection.end();