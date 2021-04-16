


import React, { Component } from 'react'
import Header from './compments/Header'

import './App.css';
import List from './compments/List';

export default class App extends Component {
  state = {
    list : [{id:1,name:'吃饭',done:true},{id:2,name:'睡觉',done:false}]
  }
  add=(todo)=>{
    const {list} =this.state;
    const newList = [todo,...list];
    this.setState({list:newList});
  }

  render() {
    return (
      <div className="App">
        <Header add={this.add}/>
        <List list={this.state.list}/>
      </div>
    )
  }
}


