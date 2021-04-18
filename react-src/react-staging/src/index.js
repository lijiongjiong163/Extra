//1.引入react核心库
import React from "react";
//2.引入reactDOM
import ReactDOM from "react-dom"
//3.引入app组件
import App from "./App"
//引入路由组件
import {BrowserRouter} from "react-router-dom"
//BrowserRouter 是路由器，两种中的一种，另一种是HashRouter

ReactDOM.render(
    <BrowserRouter>
        <App/>
    </BrowserRouter>,
document.getElementById("root"))