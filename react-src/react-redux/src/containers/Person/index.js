import React, { Component } from 'react'
import { connect } from 'react-redux';
import {addPerson} from '../../redux/actions/person'
import {nanoid} from 'nanoid'


class Person extends Component {
    addPerson=() => {
        const {value:name}=this.addName
        const {value:age}=this.addAge
        this.props.addPerson({id:nanoid(),name,age})
        this.addName.value=''
        this.addAge.value=''

        
    }
    render() {
        const persons=this.props.person
        return (
            <div>
                <h1>我是Person组件,上方组件求和为：{this.props.count}</h1>
                <input ref={c => this.addName=c} type='text' placeholder='输入人名'></input>
                <input ref={c => this.addAge=c} type='text' placeholder='输入年龄'></input>
                <button onClick={this.addPerson}>添加</button>
                <ul>
                    {persons.map((personObj) => {
                        return <li key={personObj.id}>姓名：{personObj.name}   , 年龄：{personObj.age}</li>
                    })}
                </ul>
            </div>
        )
    }
}
export default connect((state) => ({person:state.person,count:state.count}),{addPerson})(Person)