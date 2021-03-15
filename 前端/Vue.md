## 1.创建第一个Vue应用

```html
<div id="app">
			{{message}} {{name}}
</div>
```

Vue应用

```html
		<script type="text/javascript">
			var obj =new Vue({
				el:'#app',//el属性：传入选择器，用来绑定元素
				data:{
					message:'啥几把玩意',
					name:'Vue'
				}	//data属性：传入对象
			});
         </script>
```

上面一段代码和下面一段是一样的：

```html
<script type="text/javascript">
    		var data = {message:'啥几把玩意',name:'Vue'}
			var obj =new Vue({
				el:'#app',//el属性：传入选择器，用来绑定元素
				data:data	//data属性：传入对象
			});
         </script>
```

## 2.$符号的使用

```javascript
var data ={a:123,data:'沙袋哦'};
			var vm = new Vue({
			el:'#app',
			data:data
			});
		
		console.log(vm.data);//沙袋哦
		console.log(vm.$data===data);//true

vm.$watch('a', function (newValue, oldValue) {
  // 这个回调将在 `vm.a` 改变后调用
})
```

用$可以取出Vue对象本身的属性和函数，比如el和data，还有watch函数，不加$就只能取出data绑定的对象中的属性了。

## 3.插值

### 3.1 文本

{{name}}就可以了，然后你改变vm.name，标签中的{{name}}也就改变了；

通过使用 [v-once 指令](https://cn.vuejs.org/v2/api/#v-once)，你也能执行一次性地插值，当数据改变时，插值处的内容不会更新。

```html
<span v-once>这个将不会改变: {{name}}</span>
```

### 3.2 HTML

假如说你的name的内容是：

```html
<span style="color:red">名字</span>
```

如果你用双括号，就会把上面的文字以字符形式输出在页面上，但如果你就是想让他转html呢？

你只需要给想要加的那个元素加上v-html属性就行了，让v-html="name"就行啦：

```html
<div v-html="name">
    
</div>
```

系统就会转化成这样：

```html
<div >
    <span style="color:red">名字</span>
</div>
```

### 3.3 属性

要想动态的为一个标签加上属性，可以使用**v-bind:属性名=变量名**的方法：

现在来看实例：

html：

```html
<div id="div1">
			<span v-bind:class="color">啥几把玩意</span>
</div>
<button onclick="change()">变化</button>
```

这里是给span加了一个class属性，只不过目前这个属性的值是一个叫color的变量

css:

```css
<style>
			.red{
				color: red;
			}
			.blue{
				color: blue;
			}
</style>
```

js:

```javascript
var haha= {	
			color:'red'
		  }
var vm = new Vue({
			el:'#div1',
			data:haha
		        });

//按钮的click函数
var change = function(){
			if(haha.color == 'blue'){
				haha.color = 'red';
			}else{
				vm.color = 'blue';
			}	
		}
```

这样就可以动态的修改span的class属性，只要修改color这个变量的值，就可以修改span的class，就会引起颜色的变化。

## 4.指令

### 4.1 v-if

```html
<p v-if="seen">
    哈哈
</p>
```

如果seen这个变量的值是true就渲染，为false则不渲染

### 4.2 v-bind

给元素绑定属性用的

### 4.3 v-on

用于监听DOM事件：

```html
<a v-on:click="doSomething">...</a>
```

### 4.4 修饰符

给指令加后缀，可以用于指出一个指令应该以特殊方式绑定。

## 5.Vue对象中的属性

我们已经了解了el和data两个属性，再学几个：

| 关键字   | 名称     |
| -------- | -------- |
| methods  | 方法     |
| computed | 计算属性 |
| watch    | 监听属性 |

### 5.1 methods

methods就是普通的方法写在里面；

```javascript
var vm = new Vue({
				el:'#div1',
				data:{
					firstName:'LI',
					lastName:'jiong'
				},
				methods:{
                    //获取当前时间
					nowDate:function(){
						return Date.now();
					}
				});
```

在html中可以直接调用：

```html
<div id="div1">
		{{nowDate()}}    
    </div>
```



### 5.2 computed

computed是计算属性,就是有些属性是需要计算得出来的，比如FullName，就是由firstName和last Name相加起来的。

```javascript
var vm = new Vue({
				el:'#div1',
				data:{
					firstName:'LI',
					lastName:'jiong'
				},
				
				computed:{
					fullName:function(){
						return this.firstName+this.lastName;
					}
				}
			});
```

计算属性的调用和普通属性一样的：

```html
<div id="div1">
		{{fullName}}     
    </div>
```

从表面上看来，计算属性和函数的逻辑几乎一模一样，除了调用的时候少个括号。但其实不一样的，计算属性只是在firstName或者lastName被改变的时候才重新执行，而函数则是每次调用都重新执行一遍。

上面介绍的其实是计算属性的getter，因为你每次调用其实就相当于get出来这个值，你也可以显式地声明setter：

```javascript
computed:{
					fullName:{
                        get:function(){}
                        set:function(){}
                    }
				}
```

这时候，再给

### 5.3 watch

watch没啥说的，监控呗，监控一个属性，这属性只要变化了，就执行监控函数。监控函数无返回值。

```javascript
var vm = new Vue({
				el:'#div1',
				data:{
					firstName:'LI',
					lastName:'jiong'
				},
				
				watch:{
					firstName:function(){
						console.log('被我发现啦！');
					}
				}
			});
```

1.函数名和属性名要一致

2.函数无返回值

## 6.Class的绑定

class绑定花样真滴多：

### 第一种：

```html
<div v-bind:class="{ active: isActive,'text-danger': hasError  }"></div>
```

当你vue对象中的data中的isActive的值是true的时候，这个div的class才会被绑定上active。

### 第二种：

直接绑个对象（代码块？）：

```html
<div :class="classObject"></div>

```

```javascript
data: {
  classObject: {
    active: true,
    'text-danger': false
  }
}
```

### 第三种：

还能绑定计算属性：

```html
<div v-bind:class="classObject"></div>
```



```js
data: {
  isActive: true,
  error: null
},
computed: {
  classObject: function () {
    return {
      active: this.isActive && !this.error,
      'text-danger': this.error && this.error.type === 'fatal'
    }
  }
}
```

## 7.v-for

使用：v-for='元素别名 in 数组名'

### 7.1遍历数组

除了数组元素，还可以遍历数组下标。v-for="元素别名,下标别名in 数组名"；别名随便取，反正第一个值就是元素的别名，第二个就是下标。

```html
		<ul id ='ul1'>
			<li v-for="shabi,index in what">{{title}}{{index}}-{{shabi.name}}</li>
		</ul>
		
		<script type="text/javascript">
			var vm = new Vue({
				el:'#ul1',
				data:{
					title: '人物名称：',
					what:[
						{name:'lijiong'},
						{name:'wangwei'}
					]
				}
			});
		</script>
```

### 7.2遍历对象

遍历对象就是把对象的属性都遍历出来,和数组不同的是，第一个值（value）是属性值，第二个是值是属性的属性名，第三个值是下标，只是跟顺序有关，与名字叫啥无关。

```html
<li v-for=" value,name of duixiang">{{name}}:{{value}}</li>
```

```js
duixiang:{
						name:'火锅',
						sex:'母',
						age:2
					}
```

## 8.表单（v-model）

```html
<body>
		<div id='test'>
		<h1>输入框</h1>
		<!-- 不加.lazy就是边改边渲染，加上.lazy就可以输入完再渲染 -->
		<input type="text" v-model.lazy="message"/>
		<p>{{message}}</p>
		<h1>文本框</h1>
		<textarea rows="3" cols="40" placeholder="输入文本" v-model="textarea">
		</textarea>
		<p>{{textarea}}</p>
		
		<h1>单个复选框</h1>
			<label for='cb1'>Checkbox</label>
			<input id='cb1' name="Checkbox" type="checkbox" value="lijiong" v-model="check" true-value="yes">
			<p>{{check}}</p>
		<h1>多个复选框</h1>
		<label>张强</label>
		<input id='cb2' name="Checkbox" type="checkbox" value="zhangqiang"  v-model="checks">
		<label>王伟</label>
		<input id='cb3' name="Checkbox" type="checkbox"  value="wangwei" v-model="checks">
		<p>{{checks}}</p>
		<h1>单选框</h1>
		<!-- 原本html是凭name去判断是不是一组，现在用v-model绑定同一个vue属性就行了 -->
			<label>人</label>
			<input name="radio" type="radio" value="人" v-model="radio">
			<label>狗</label>
			<input name="radio" type="radio" value="狗子"  v-model="radio">
			<p>{{radio}}</p>
		<h1>选择框</h1>
		你是：
				<select name="s1"   v-model="s1">
					<option value="傻逼">SB</option>
					<option value="智障">ZZ</option>
					<option value="脑瘫">NT</option>
					
					
				</select>
				<p>{{s1}}</p>
		</div>
		<script type="text/javascript">
			var vm = new Vue({
				el:'#test',
				data:{
					message:'',
					textarea:'',
					check:'',//单个复选框，选上就是true，没选上就是false
					checks:[],//多个v-model对应这一个数组，选上就是value，没选上就是null
					radio:'',
					s1:''
				}
			});
		</script>
	</body>
```



