//generator函数中throw函数的用法
function *generator(){
    try {
        console.log('哈哈哈');
        
        let a= yield 1;
        console.log("a=",a);
        let b= yield 2;
        console.log("b=",b);
        let c= yield 3;
        console.log("c=",c);
        return "执行完毕"
    } catch (error) {
        console.log(error);
        
    }
   
    
}

let gen=generator();
// console.log(gen.next("第一此调用next"));
// console.log(gen.next("第二此调用next"));
// console.log(gen.return("调用return"));
// console.log(gen.next("第三次调用next"));

