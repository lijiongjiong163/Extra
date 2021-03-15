# JSX语法规则

1. 定义虚拟DOM时，不要写引号

2. 标签中想要调用或混入JS表达式时，请使用{}

   (注：要搞清楚js表达式和js代码两个概念：

   ​	js表达式：一个表达式会产生一个值，可以放在任何一个需要值的地方

   ​		(1)  a

   ​		(2)  a+b

   ​		(3)  demo(1)

   ​		(4)  arr.map()

   ​		(5)  function test(){}

   ​	js语句：

   ​		(1)  if()

   ​		(2)  for()

   ​		(3)  switch(){case:xxxx}

   )

3. 不能用class，要用className

4. 内联样式，要用style={{key:value,key:value}}的形式去写，其中，外层的{}意思是里面要混入js表达式了，内层的{}意思是里面是一个js对象（注：js中对象的属性名不能有-，如果要写font-size这种就写驼峰命名）

5. 虚拟DOM只能有一个根标签

6. 标签必须闭合，或自结束

7. 标签首字母
   (1)  若小写字母开头，则将该标签转为html中同名元素，若html中无同名元素，则报错。
   (2)  若大写字母开头，react就去渲染对应的组件，若组件未定义，则报错。

实例：

```jsx
<body>
		<div id="root">	
		</div>
    
		<script type="text/babel">
			const VID = "tEsT"
			const text = "jSx is Sb"
			const text2 = "确实"
			//1.创建虚拟dom
			var VDOM =
			<div>//1.定义dom时不要写引号;2.必须只有一个根元素
				<h1 className='title' style={{color:'red',fontSize:'100px'}} id={VID.toLowerCase()}>//3.不能用class，要用className；4.内联样式，要用style={{key:value,key:value}}的形式去写
					{text}//5.标签中想要调用或混入JS表达式时，请使用{}
				</h1>
				<h2>{text2}</h2>
				<input type='text'/> //6.标签必须闭合
			</div>
			//2.渲染到页面
			ReactDOM.render(VDOM,document.getElementById('root'))
		</script>
</body>
```

下面再看看对数组的一个练习：

```jsx
	<script type="text/babel">
			var title = '前端框架'
			var data =['Vue','React','安哥拉']
			
			//1.创建虚拟dom
			var VDOM = (
			<div>
				<h1 >{title/*他妈在这注释不要{}*/}</h1>
				<ul>
					{data.map((haha,index)=>{
						console.log(haha+index)/*这里是js语法,调haha不需要{}*/
						return <li key = {index}>{haha}{/*这里就成jsx语法了*/}</li>/*虚拟DOM还非要个key,就tm离谱*/
					})}   {/*花括号里必须要表达式才行*/}
				</ul>
			</div>
				
			)
			//2.渲染到页面
			ReactDOM.render(VDOM,document.getElementById('root'))
		</script>
```

首先，要分清js和jsx,在script标签中写的东西，照样是javascript的语法规则，只有被html标签包住的地方，才应用jsx语法规则，然后，如果在标签中的{}中，就又回到js语法了。

