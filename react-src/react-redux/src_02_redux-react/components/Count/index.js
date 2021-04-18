import React, { Component } from 'react'




export default class Count extends Component {

    increase=() => {
        const {value}=this.selectNumeber
        this.props.increase(value*1);
    
    }
    decrease=() => {
        const {value}=this.selectNumeber
        this.props.decrease(value*1);
        
    }
    increaseIfOdd=() => {
       if(this.props.count%2===1){
        const {value}=this.selectNumeber
        this.props.increase(value*1);
       }
        
    }
    render() {
        return (
            <div>
                <h1>当前求和为：{this.props.count}</h1>
                <select ref={(c) => this.selectNumeber=c}>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>&nbsp;  
                <button onClick={this.increase}>加</button>    &nbsp;       
                <button onClick={this.decrease}>减</button> &nbsp;  
                <button onClick={this.increaseIfOdd}>奇数加</button> 
            </div>
        )
    }
}
