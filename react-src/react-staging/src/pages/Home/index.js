import React, { Component } from 'react'
import News from "./News"
import Message from "./Message"
import { NavLink, Redirect, Route, Switch } from 'react-router-dom'

export default class Home extends Component {
    render() {
        return (
            <div className="col-xs-6">
        <div className="panel">
          <div className="panel-body">
            <div>
              <h2>Home组件内容</h2>
              <div>
                <ul className="nav nav-tabs">
                  <li>
                    <NavLink activeClassName="active" className="list-group-item " to="/home/news">news</NavLink>
                    
                  </li>
                  <li>
                  <NavLink activeClassName="active" className="list-group-item " to="/home/message">message</NavLink>

                  </li>
                </ul>
                <div>
                    <Switch>
                   <Route path="/home/news" component={News}/>
                   <Route path="/home/message" component={Message}/>
                   <Redirect to="/home/news"></Redirect>
                   </Switch>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
        )
    }
}
