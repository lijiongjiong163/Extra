import {INCREASE,DECREASE} from './constant'
//初始化state
let initState = 0;
export default function countReducer(preState=initState,action){
    const {type,data}=action
    console.log(preState);
    
    switch (type) {
        case INCREASE:
            return preState+data; 
        case DECREASE:
            return preState-data;
        default:
            return preState;
    }
}