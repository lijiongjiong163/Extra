# babel使用

1.新项目先：npm init

2.安装babel:

```
npm i -g babel-cli --save-dev
```

2.创建babel的配置文件：  .babelrc

并在其中填写

```json
{
    "presets":["es2015"],//设置转码规则(转码器)
    "plugins":[]//设置插件
}
```

3.然后安装这个转码器：

```markdown
npm install --save-dev babel-preset-es2015
```

4.执行转码命令，将src中的文件转码，转码后文件放到dist文件夹

```markdown
babel src -d dist
//两个指令都行
babel src --out-dir dist
```

或者执行转码具体的某个文件

```markdown
//只在命令行输出转码结果
babel test.js
//转换并保存到新文件(--out-file或者-o都行)
babel es6.js --out-file es5.js
```

# 自定义脚本

这个其实是npm中的内容，npm中的

scripts可以用来自定义脚本，可以给其中加入：

```json
"scripts":{
    "build":"babel src -d dist"
}
```

以后直接使用就可以调用：

```markdown
npm run build
```



