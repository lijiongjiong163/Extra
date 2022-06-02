### 1.v-show,v-if,v-else-if,v-else

#### 1.1 v-show

v-show=true则显示，v-show=false则隐藏。并不是不渲染，而是渲染出来再隐藏。

#### 1.2 v-if

真则显示，假则不渲染。

可以和v-else-if,v-else一起用，但用的话必须所有元素紧挨着

#### 1.3 v-for

加在标签上就能遍历数组或者对象，让它重复显示。

遍历数组：

```html
 <ul>
     <li v-for="(person,index) in persons" :key = "person.id">{{person.name}}---{{person.age}}</li>
</ul>
```

```:barber:
        let vm = new Vue({
            el: "#root",
            data: function () {
                return {
                    keyWord:'',
                    persons:[
                        {id:001,name:'马冬梅',age:12},
                        {id:002,name:'周冬雨',age:13},
                        {id:003,name:'周杰伦',age:14},    
                        {id:004,name:'林依伦',age:15}

                    ]
                }
            }

        });


```

**ps:**遍历时需要声明一个key，最好用数据的唯一id，而不是数组下标，因为当你做一些破坏顺序的操作时，可能会引发一些 问题。（1.性能不好，2.如果有输入模块则会出现错误）

遍历对象：

```html
<div v-for="(val,key) in Obj">{{key}}---{{val}}</div>
```

```:barber:
 data: function () {
                return {
                	Obj:{
                        name:'什么',
                        sex:'男'
                    	}
                }
            }
                 
```

**ps:**遍历对象 时会默认把属性名当成key

### 2.list过滤

需求：在input框中写字，list中显示含这个字 的人名。

![1651112945486](C:\Users\LiJiong\AppData\Roaming\Typora\typora-user-images\1651112945486.png)

相关知识点：indexOf()和filter() （见[常见函数.md](../../常见函数)）

使用watch实现：

```html

    <div id="root">
        <ul>
            <input type="text" v-model="keyWord">
            <li v-for="(person,index) in newPersons" :key = "person.id">{{person.name}}---{{person.age}}</li>
        </ul>
    </div>
    <script>
        let vm = new Vue({
            el: "#root",
            data: function () {
                return {
                    keyWord:'',
                    persons:[
                        {id:001,name:'马冬梅',age:12},
                        {id:002,name:'周冬雨',age:13},
                        {id:003,name:'周杰伦',age:14},    
                        {id:004,name:'林依伦',age:15}

                    ],
                    newPersons:[]
                }
            },
            watch:{
                keyWord:{
                    immediate:true,
                    handler(newVal){
                        this.newPersons=this.persons.filter((person)=>{//filter()
                            return person.name.indexOf(newVal) !==-1;//indexOf()
                        })
                    }
                }
            }

        });


    </script>
```

使用computed实现：

```html
<div id="root">
        <ul>
            <input type="text" v-model="keyWord">
            <li v-for="(person,index) in newPersons" :key = "person.id">{{person.name}}---{{person.age}}</li>
        </ul>
</div>
 <script>
let vm = new Vue({
            el: "#root",
            data: function () {
                return {
                    keyWord:'',
                    persons:[
                        {id:001,name:'马冬梅',age:12},
                        {id:002,name:'周冬雨',age:13},
                        {id:003,name:'周杰伦',age:14},    
                        {id:004,name:'林依伦',age:15}

                    ],
                    
                }
            },
            computed:{
                newPersons(){
                    return this.persons.filter((person)=>{
                            return person.name.indexOf(this.keyWord) !==-1;
                        })
                }
            }

        }); 
 </script>
```





