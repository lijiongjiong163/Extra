//1.使用createStore方法来创建stroe对象
import {createStore} from 'redux'
//引入redux开发工具
import {composeWithDevTools} from 'redux-devtools-extension'
//createStore方法需要传入reducer对象
import allReducers from './reducers'
export default createStore(allReducers,composeWithDevTools())
