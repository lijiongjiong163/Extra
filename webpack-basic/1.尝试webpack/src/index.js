/*
    index.js:webpack入口起点文件

    1.找到入口起点文件
    2.运行指令：webpack .\src\index.js -o .\build\main.js --mode=development
        翻译：webpack会以.\src\index.js为入口文件开始打包，打包后输出到.\build\built.js，整体打包环境是开发环境,如果是开发环境，就是--mode=production

*/
import data from "./data.json";
function add(x,y){
    return x+y;
    
}
console.log(add(123,42));
console.log(data);

