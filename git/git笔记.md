## 1.git的工作机制

![1655773493663](C:\Users\LiJiong\AppData\Roaming\Typora\typora-user-images\1655773493663.png)

自己写的文件，文件 下标是问号，说明此时文件在工作区，还未被git进行 管理；

使用 add命令将文件加入到暂存区，此时文件下标成为感叹号。

提交后则进入本地库。

进入本地库后则生成版本，意味着无法彻底删除。

## 2.git常用命令

| 命令                                 | 说明             |
| ------------------------------------ | ---------------- |
| git config --global user.name 用户名 | 设置用户签名     |
| git config --global user.email 邮箱  | 设置用户签名     |
| git init                             | 初始化本地库     |
| git status                           | 查看本地库状态   |
| git add 文件名                       | 添加到暂存区     |
| git commit -m "日志信息" 文件名      | 提交到本地库     |
| git reflog                           | 查看历史记录     |
| git reset --hard 版本号              | 版本穿梭         |
| git rm --cached 文件名               | 删掉暂存区的文件 |

## 3.设置用户签名

安装 好git后设置一次用户签名，用作是用来区分不同操作者的代码。和gitHub或者其他代码托管中心的账号没有任何关系。

设置后可在C:\Users\LiJiong\\.gitconfig文件中查看。

## 4.历史版本

### 4.1 查看历史版本

- git reflog		精简版版本信息

- git log 			版本信息

### 4.2 版本穿梭

- git reset --hard 版本号

穿梭到具体某个版本

![1655782164681](C:\Users\LiJiong\AppData\Roaming\Typora\typora-user-images\1655782164681.png)

红框中是3次提交记录，绿框中是本次版本穿梭的记录，可以看到，指针指向的是second commit；

![1655782757340](C:\Users\LiJiong\AppData\Roaming\Typora\typora-user-images\1655782757340.png)

底层是一个指针，你可以控制这个指针 指向哪个版本。

## 5.分支

常用命令

| 命令                | 作用                         |
| ------------------- | ---------------------------- |
| git branch 分支名   | 创建分支                     |
| git branch -v       | 查看分支                     |
| git checkout 分支名 | 切换分支                     |
| git merge 分支名    | 把指定的分支合并到当前分支上 |

### 5.1合并冲突

当发生冲突时，就不是一句git merge 能够解决的事情了。

1. 假如我们要把hot-fix合并到master分支上，我们先切回master分支，然后使用 git merge hot-fix 命令来合并，发现有报错，hello.txt冲突了。

![1655956101425](C:\Users\LiJiong\AppData\Roaming\Typora\typora-user-images\1655956101425.png)

2. 此时，括号中的master变成了master|merging，且使用git status查看状态时，发现hello.txt又变成了红色，写着两个分支都更改了它。

![1655956298153](C:\Users\LiJiong\AppData\Roaming\Typora\typora-user-images\1655956298153.png)

3. 此时打开hello.txt，发现内容变了



![1655956367935](C:\Users\LiJiong\AppData\Roaming\Typora\typora-user-images\1655956367935.png)

<<<<<<HEAD

=========

\>>>>>>>> hot-fix

从head到====，是本分支的内容，从=====到hot-fix，是hot-fix的内容。需要手动处理 冲突代码，将代码合并好，然后在把上面的多余符号删掉，再保存。

4. 此时已经手动解决了冲突，但使用git status查看一下，还是红色的。所以还是要重新加一下暂存区（git add hello.txt）。
5. 再重新提交一下，注意，此时的提交不能带文件名，直接git commit -m "日志信息" 就行了。经过这一步，就算完成了，再看括号中的master|merging变回了master，大功告成 。





