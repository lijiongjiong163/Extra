import React, { Component } from 'react'

export default class Item extends Component {
    render() {
        const {name,done}=this.props
        return (
            <li >
                <label>
                    <input type='checkbox' defaultChecked={done}></input>
                    <span> {name}</span>
                </label>  
            </li>
        )
    }
}
