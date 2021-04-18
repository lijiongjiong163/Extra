import { DECREASE, INCREASE } from "../constant";

export function createIncreaseAction(data){
    return {type:INCREASE,data}
}

export function createDecreaseAction(data){
    return {type:DECREASE,data}
}