import React, { Component } from 'react'
//引入connect 方法，用于连接UI组件和redux，需预先下载
import {connect} from 'react-redux'

import { createDecreaseAction, createIncreaseAction } from '../../redux/actions/count'



function mapDispatchToProps(dispatch)  {
    return {
        increase:(number) => {
            dispatch(createIncreaseAction(number))
        },
        decrease:(number) => {
            dispatch(createDecreaseAction(number))
        }
    }
}

class Count extends Component {

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
                <h1>我是Count组件,person组件人数为：{this.props.personNum}</h1>
                <h3>当前求和为：{this.props.count}</h3>
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


export default connect(state=>({personNum:state.person.length,count:state.count}),mapDispatchToProps)(Count)

