import { ADD } from "./content"

export default {
    addAction(data){
        return{
            type:ADD,data
        }
    }
}