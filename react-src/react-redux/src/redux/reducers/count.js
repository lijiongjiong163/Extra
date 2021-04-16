import { INCREASE,DECREASE } from "../constant";

const init =0;
export default function countReducer(preState=init,action){
    const {type,data} =action;
    
    switch (type) {
        case INCREASE:
            return preState+data;
        case DECREASE:
            return preState-data;
        default:
            return preState;
    }
}