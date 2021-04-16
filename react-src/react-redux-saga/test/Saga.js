function channel(){
    let array =[];
    //cb:回调函数
    //matcher:匹配器
    function take(cb,matcher){
        cb.match=matcher;
        array.push(cb);
    }
    function put(action){
        for(let i=0;i<array.length;i++){
            let cb=array[i];
            if(cb.match(action)){
                cb(action);
            }
        }
    }


    return{take,put}
}
const chann = channel();
function cb(action){
    console.log('store.dispatch()',action);

}
function matcher(action){
    return action.type==='ADD_ASYNC'
}
chann.take(cb,matcher);
chann.put({type:'ADD',data:10086})
chann.put({type:'ADD_ASYNC',data:10086})