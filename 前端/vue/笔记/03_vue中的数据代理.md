数据代理原理[见JS笔记的第7节](../../JS.md)

vue中同样应用了数据代理

1. Vue中的数据代理：

   通过vm对象来代理data对象中属性的操作（读/写）

2. Vue中数据代理的好处：

   更加方便的操作data中的数据

3. 基本原理：

   通过Object.defineProperty()把data对象中的所有属性加到vm上，为每一个添加到vm上的属性，都指定一个 getter/setter。在getter/setter内部去操作data中对应的属性。


![1647847133343](C:\Users\LiJiong\AppData\Roaming\Typora\typora-user-images\1647847133343.png)

图中左边部分并没有使用数据代理，只是把创建vm对象时内部声明的data对象以_data属性的方式加在vm对象中。其实这时候开发者已经可以使用 _data.name 去操作name属性了，但是很不方便，所以vue使用了图片右边的数据代理方式将 _data中的属性加在vm对象本身上，这样操作起来会方便很多。