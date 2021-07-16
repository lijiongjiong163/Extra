/*
    webpack 的配置文件：打包html文件需要用到插件啦
*/

//需要引入node.js的path模块，resolve方法用来获得绝对路径
const {resolve} = require('path');
//plugins使用的第二步，引入
const HtmlWebpackPlugin1 = require('html-webpack-plugin');

module.exports={
    //配置入口起点
    entry:'./src/index.js',

    //输出地址的配置，是个对象
    output:{
        //输出文件名
        filename:'built.js',
        //输出路径(避免出错要用绝对路径)
        //__dirname:nodejs中的一个变量，代表当前文件目录的绝对路径
        path:resolve(__dirname,'build')
    },
    
    //loader配置，是个对象
    //使用：1.下载  2.配置
    module:{
        //rules：指示数组
        rules:[
          //loader配置,不同文件需要配置不同的loader
          {
            //test:匹配哪些文件
            test:/\.css$/,
            //如果需要多个loader就用use数组,如果只用一个loader就直接用 loader:'file-loader' 就可以了
            use:[
                //use数组中loader执行顺序：由右向左，由下到上
                //创建style标签，将js中的样式资源插入，添加到head中生效
                'style-loader',
                //将css文件变成commonjs模块加载到js中，里面的内容是样式字符串
                'css-loader'
            ]
        }
        ]
        
    },

    //plugins配置，是个数组
    //使用：1.下载 2.引入 3.调用
    plugins:[
        //详细plugins配置
        //将html模板和入口文件打包在一起
        new HtmlWebpackPlugin1({
            //设置模板文件，编译后会将这个文件输出，并把编译好的入口文件引进去
            template:'./src/test.html'
        })
        
    ],

    //模式配置
    mode:'development',
    //mode:'production'
    
    //开发服务器(热部署)
    //只会在内存中编译打包，不会真的输出编译后文件
    //启动devServer的指令为：1.下载webpack-dev-server 2.webpack版本5就要用这个指令：npx webpack serve
    devServer:
    {
        //要运行的项目的目录
        contentBase: resolve(__dirname,'build'),
        //启动gzip压缩
        compress:true,
        //端口号
        port:3000,
        //自动打开浏览器
        open:true
    }

}