import React, { Component } from 'react'

import Item from '../Item'

export default class List extends Component {
    render() {
        const {list}= this.props
        return (
            <ul>
                {
                    list.map((item)=>{
                        return <Item key={item.id} {...item}/>
                       
                    })
                }
            </ul>
        )
    }
}
