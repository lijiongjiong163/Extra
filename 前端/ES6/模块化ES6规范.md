使用import和export来做导入导出

## 1.分别暴露

例：

创建一个文件userApi.js

```javascript
export function getList(){
    //调后台取数据
    console.log("获取数据列表");
}
export function save(){
    //异步获取数据
    console.log("保存数据")
}
```

### 导入

```javascript
//方式一
import {getList,save} from './userApi.js'
 getList();
//方式二
import * as mi from './userApi.js';
mi.getList();
```



## 2.默认暴露

例：

创建一个文件userApi.js

export default 后面可以跟字符串，数组之类啥都行，通常会跟一个对象

```javascript
export default{
     getList(){
    //调后台取数据
    console.log("获取数据列表");
},
 	save(){
    //异步获取数据
    console.log("保存数据")
}
}

```

### 导入

```javascript
//方式一：只适用于默认暴露
import user from './userApi.js'
//此时就可整个导入成一个对象，然后用这个对象去操作里面的方法；
user.getList();
user.save();
//方式二
import * as user from './userApi.js'
user.default.getList();
```

## 3.在浏览器中使用es6模块化

方式一，直接在html中写js引入：

script标签的type要改成module

```javascript
<script type="module">
        import {getList,save} from './test3.js'
        getList();
</script>
```

方式二，创建一个入口文件，通过引入入口文件的方式去间接引入：

1.创建app.js，在里面引入需要的模块

2.在html中引入这个入口文件,type="module"：

```javascript
<script src="./src/js/test.js" type="module"></script>
```

## 4.开发步骤

在实际开发中，很少会直接从html里去引入模块，标准流程如下：

1. 而是将所有的import语句全部放入一个js（例如app.js），然后使用babel将所有代码（要使用的模块js文件，还有app.js）转化成es5。

```javascript
//app.js
import * as m1 from './export';
import m2 from './defaultexport';
m1.getList();
m2.fly();
```

2. 转化完成后还是不能直接引用，需要再用打包工具打包后，生成的文件才能供html文件引用

```markdown
//将app.js打包成bundle.js
npx browserify .\dist\import-export\app.js  -o .\dist\bundle.js 
```

此时就可以引用bundle.js了

```html
<script src="./dist/bundle.js" type="module"></script>
```



