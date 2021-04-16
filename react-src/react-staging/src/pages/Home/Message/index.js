import React, { Component } from 'react';
import { Link, Route } from 'react-router-dom'
import Detil from './Detil'

export default class Message extends Component {
    state={
      message:[
        {id:1,title:"文章1"},
        {id:2,title:"文章2"},
        {id:3,title:"文章3"}
      ]
    }
    pushShow=(id,title)=>{
      this.props.history.push(`/home/message/detil/${id}/${title}`)
    }

    replaceShow=(id,title)=>{
      this.props.history.replace(`/home/message/${id}/${title}`)
    }
    render() {
        const {message}=this.state
        return (
          <div>
            <ul>
            {message.map(mesObj=>{
              return (<li key={mesObj.id}>
                <Link to={`/home/message/detil/${mesObj.id}/${mesObj.title}`}>{mesObj.title}</Link>
                <button onClick={()=>this.pushShow(mesObj.id,mesObj.title)}>path</button>
                &nbsp;
                <button onClick={()=>this.replaceShow(mesObj.id,mesObj.title)}>replace</button>
                </li>)
              
            })}
          </ul>
          <hr/>
          <div>
            
              <Route path="/home/message/detil/:mid/:mtitle" component={Detil}></Route>
              
          </div>
          </div>
        )
    }
}
