function *generator(){
    try {
        let a= yield 10;
        console.log("a=",a);
        let b= yield 200;
        console.log("b=",b);
        let c= yield 3000;
        console.log("c=",c);
        return "执行完毕"
    } catch (error) {
        console.log(error);       
    }
   
}
function co(generator){
    let it =generator();

    function move(arg){
        let result=it.next(arg)
        if(!result.done){
            move(result.value)
        }
    };
    move();
    
}

co(generator);