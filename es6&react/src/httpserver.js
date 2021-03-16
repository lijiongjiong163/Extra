/**
 * 使用js创建一个httpServer服务
 */
//导入模块是require，类似java的import
const http= require('http');

// 1.创建一个httpserver服务
const server = http.createServer(function(request,response){
    response.writeHead(200,{'Content-type':'text/html'});
    response.end("<h1>hello,nodejs!</h1>");
});
// 2.监听一个端口
server.listen(8888);
console.log('已启动！http://localhost:8888')
// 3.启动运行服务(node ./httpserver.js)
// 4.使用浏览器访问