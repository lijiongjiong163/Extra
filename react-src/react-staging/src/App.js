import {Component} from "react";
import { Link,Redirect,Route, Switch } from "react-router-dom";
import About from "./pages/About";//路由组件
import Home from "./pages/Home";//路由组件
import Header from "./component/Header"//一般组件


export default class App extends Component {

    render(){
        return (
            <div>
            <div className="row">
              <div className="col-xs-offset-2 col-xs-8">
                <div className="page-header"><Header/></div>
              </div>
            </div>
            <div className="row">
              <div className="col-xs-2 col-xs-offset-2">
                <div className="list-group">
                  {/* <a className="list-group-item active" href="./about.html">About</a>
                  <a className="list-group-item" href="./home.html">Home</a> */}
                  
                    <Link className="list-group-item " to="/about">About</Link>
                    <Link className="list-group-item " to="/home">Home</Link>
                </div>
              </div>
                <div className="col-xs-6">
                    <div className="panel">
                        <div className="panel-body">
                          <Switch>
                            <Route path="/about" component={About}/>
                            <Route path="/home" component={Home}/>
                            <Redirect to="/home"/>
                            </Switch> 
                        </div> 
                    </div>
                </div>
            </div>
          </div>
        )
    }
}