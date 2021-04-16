import React, { Component } from 'react'
import {connect} from 'react-redux'
import actions from '../../redux/action'

class Count extends Component {
    add=(num) => {
        this.props.addAction(num)
    }
    addAsyn=(num) => {
        
    }
    render() {
        return (
            <div>
                <h1>当前求和为：{this.props.count}</h1>
                <button onClick={(event)=>this.add(1,event)}>+</button>
                <button onClick={(event)=>this.add(2,event)}>+2</button>
                <button onClick={(event)=>this.addAsyn(1,event)}>+2</button>
            </div>
        )
    }
}
export default connect(state=>({count:state.count}),actions)(Count);