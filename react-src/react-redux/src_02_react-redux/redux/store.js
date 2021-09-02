//使用createStore方法来创建stroe对象
import  { createStore } from "redux"
//createStore方法需要传入reducer对象
import countReducer from './countReducer'
export default createStore(countReducer)