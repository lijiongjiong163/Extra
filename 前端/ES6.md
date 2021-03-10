## 1.var，let，const



### var
var定义的变量，只作用于当前**函数作用域**的全局（包含子作用域）。不受块作用域的影响。

```js
var a =function(){
    var b = 3;
    console.log(b);
}
a();
console.log(b);//报错，b只在a（）作用域
```
### let

let作用于当前**块作用域**的全局（包含子作用域）

例1：

```javascript
   var a = [];
   for (var i = 0; i < 10; i++) {
     a[i] = function () {
       console.log(i);
     };
   }
   a[6](); //10
```

   用var定义i，i不受块作用域束缚，作用于全局，也就是全局就这一个i，function中的console.log(i);指向的就是这个i，而且**函数赋值给变量时，只在调用该变量时才执行**，当在for循环外部调用函数时，函数去调用i，调用的是全局的i，已经变成10了，所以输出10；

```javascript
var a = [];
for (let i = 0; i < 10; i++) {
  a[i] = function () {
    console.log(i);
  };
}
a[6](); //6
```

let受块作用域的束缚，且使用for的时候，每一次循环都是一个新的i，当前的`i`只在本轮循环有效，所以每一次循环的`i`其实都是一个新的变量，function中的console.log(i);指向的是本轮的这个 新的i，最后调用的时候，就会去寻找它当时绑定的那一轮的i，所以最后输出的是`6`。



另外，`for`循环还有一个特别之处，就是设置循环变量的那部分是一个父作用域，而循环体内部是一个单独的子作用域。

```javascript
for (let i = 0; i < 3; i++) {
  let i = 'abc';
  console.log(i);
}
// abc
// abc
// abc
```

如果用var，那么你在里面操作了一次i，等到第二次循环，就会出现用abc去和3相比的情况，就不会打印第二次了。这就说明了let的作用域如下：

![1615347514754](D:\ideaworkspace\Extra\前端\assets\images%5C1615347514754.png)

共5个块作用域，红色全局作用域，绿色是设置循环变量的部分，也是一个单独作用域，而循环体内部是单独作用域，且每遍作用域都生成一个单独的作用域。

### var和let的作用域

var 是函数作用域，会出现变量提升带来问题

```javascript
var tmp = new Date();

function f() {
  console.log(tmp);
  if (false) {
    var tmp = 'hello world';
  }
}

f(); // undefined
```

根据就近原则，function中的tmp会先找自己作用域中的tmp，找到了，但是是在下面才声明的，所以会undefined，let是块作用域，就能避免这个问题。