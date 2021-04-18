import React, { Component } from 'react'
import {nanoid} from 'nanoid'
export default class Header extends Component {
    onKeyUp=(event)=>{
        const {add}=this.props
        
        console.log(event.target.value);
        console.log(event.keyCode);
        if(event.keyCode!==13){
            return
        }
        if(event.target.value=='')return
        const todo ={
            id:nanoid(),
            name:event.target.value,
            done:false
        }
        add(todo);
        event.target.value=''
        
    }
    render() {
        return (
            <div>
                <h1>计划表</h1>
                <input type = "text" onKeyUp={this.onKeyUp} />
            </div>
        )
    }
}
