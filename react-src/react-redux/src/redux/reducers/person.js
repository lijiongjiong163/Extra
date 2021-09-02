import { ADDPERSON } from "../constant";

const initData =[{id:'001',name:'李炯',age:13}]
export default function personReducer(preState=initData,action){
    
    console.log(preState);
    
    const {type,data}=action;
    switch (type) {
        case ADDPERSON:
            
            return [data,...preState]
            
        default:
           return preState;
    }
}