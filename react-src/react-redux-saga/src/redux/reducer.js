import { ADD, ADD_ASYNC } from "./content";

export default function reducer(preState={count:0},action){
    const {type,data}=action;
    switch (type) {
        case ADD:
            return {count:preState.count+data}
        default:
            return preState;
    }
}