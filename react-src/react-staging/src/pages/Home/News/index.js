import React, { Component } from 'react'

export default class News extends Component {
  componentDidMount(){
    console.log(this);
    setTimeout(() => {
      this.props.history.push('/home/message');
    },2000)
    
  }
    render() {
        return (
            <ul>
            <li>
              <a href="/news/1">news001</a>&nbsp;&nbsp;
            </li>
            <li>
              <a href="/news/2">news002</a>&nbsp;&nbsp;
            </li>
            <li>
              <a href="/news/3">news003</a>&nbsp;&nbsp;
            </li>
          </ul>
        )
    }
}
