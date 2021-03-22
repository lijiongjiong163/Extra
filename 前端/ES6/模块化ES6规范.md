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

