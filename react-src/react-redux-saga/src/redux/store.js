//使用createStore方法来创建stroe对象
import  { createStore,applyMiddleware } from "redux"
import createSagaMiddleware from 'redux-saga'


//createStore方法需要传入reducer对象
import countReducer from './reducer'
import {helloSaga} from '../redux-saga/helloSage'
const sagaMiddleware=createSagaMiddleware();
export default createStore(countReducer,applyMiddleware(sagaMiddleware))
sagaMiddleware.run(helloSaga);