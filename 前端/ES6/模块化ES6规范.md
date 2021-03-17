使用import和export来做导入导出

## 1.单独导出

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
import {getList,save} from './userApi.js'
```

## 2.多条导出

例：

创建一个文件userApi.js

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
import user from './userApi.js'
//此时就可整个导入成一个对象，然后用这个对象去操作里面的方法；
user.getList();
user.save();
```

