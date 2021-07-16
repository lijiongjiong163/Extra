/*
    webpack 的配置文件，有这个文件的话，直接在终端使用 webpack指令就能编译了
*/

//需要引入node.js的path模块，resolve方法用来获得绝对路径
const {resolve} = require('path')

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
        
    ],

    //模式配置
    mode:'development'
    //mode:'production'
}