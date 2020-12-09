## 1.引入

#### 1.1 依赖

```xml
<dependency>
    <groupId>org.webjars.bower</groupId>
    <artifactId>jquery</artifactId>
    <version>3.5.1</version>
</dependency>
```

#### 1.2 页面引入

```html
<script src="/webjars/jquery/3.5.1/dist/jquery.js "></script>
```

## 2.简单使用

有一个按钮，要给他绑定onclick事件：

```html
<body>
    <button id = "btnid">Say Hello!</button>
</body>
```

传统js实现方法：

```html
<script type="text/javascript">
    //js传统做法
    //1.onclick 必须在onload方法中（因为要等页面完全加载完才能拿到button的id）
    window.onload = function () {
        //2.获取按钮对象
        var btnObj = document.getElementById("btnid");
        //3.给onclick方法写内容
        btnObj.onclick = function () {
            alert("hello");
        }
    }
</script>
```

jQuery实现方法：

```javascript
$(function () {     //表示页面加载完成之后，相当于window.onload = function (){}
    //2.获取按钮对象
    var $btnObj = $("#btnid");       //1.$("#btnid")就等于ocument.getElementById("btnid");2.id用#，class用.;3.var $btnObj只是命名习惯，在jquery对象前加$,其实你爱叫啥叫啥
    //3.给onclick方法写内容
    alert($btnObj);
    $btnObj.click(function () {
        alert("JQuery.hello");
    });
});
```

## 3.$

$的本质是一个函数，叫jQuery核心函数

核心函数有4个作用：

1. **传入参数为[函数]时：在文档加载完成后执行这个函数**

   ```javascript
   $(function(){
       alert("页面加载完毕");
   });
   ```

2. **传入参数为[HTML字符串]时：根据这个字符串创建元素节点对象**

   ```javascript
   $("<div>\n" +
       "        <span>span1</span>\n" +
       "        <span>span2</span>\n" +
       "    </div>").appendTo("body");//把这个元素加到body中
   ```

3. **传入参数为[选择器字符串]时：根据这个字符串查找元素节点对象(jQuery对象)**

   $("#id属性值")：	id选择器，根据id查询标签对象

   $("标签名")：		标签名选择器

   $(".class属性值")：	类型选择器

4. **传入参数为DOM对象时：将DOM对象包装为JQuery对象返回**

   ```javascript
   var btnObj = document.getElementById("btn01");
   var $btnObj = $(btnObj);
   ```

## 4.JQuery对象

#### 4.1 jQuery对象的本质

jQuery对象是dom对象的数组（一个或者多个）+jQuery提供的一系列功能函数。

#### 4.2JQuery对象和DOM对象的互相转换：

##### dom对象转jQuery对象：

根据jQuery核心函数的用法：

var $obj = $(DOM对象);

##### jQuery对象转dom对象：

因为jQuery对象本质是dom对象的数组+函数，所以通过下标就能取出dom对象：

var dom = $obj[0];

## 5.JQuery对象的函数

| jquery方法 | 作用                                | dom类是方法 |
| ---------- | ----------------------------------- | ----------- |
| html()     | 可以获取或者设置对象标签中的内容    | innerHTML   |
| text()     | 可以获取或者设置对象标签中的文本    | innerText   |
| val()      | 可以设置或者获取表单项的value属性值 | value       |

例如：

```javascript
$("div").html();//获取div中的内容
$("div").html("<h1>写入</h1>");
```

| jquery方法 | 作用                   | 适用范围                                        |
| ---------- | ---------------------- | ----------------------------------------------- |
| attr()     | 可以设置和获取属性的值 | prop()以外的其它                                |
| prop()     | 可以设置和获取属性的值 | 推荐操作checked、readOnly、selected、disabled等 |

使用：

```html
<body>
    多选：
    <input name="checkbox" type="checkbox" value="checkbox1"/>checkbox1
    <input name="checkbox" type="checkbox" value="checkbox2"/>checkbox2
</body>
```

```javascript
$(":checkbox:first").attr("name");//获取name属性的值
$(":checkbox:first").attr("name","abc");//给name属性赋值
$(":checkbox").prop("checked",true);//实现全选

```

