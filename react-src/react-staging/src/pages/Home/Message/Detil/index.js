import React, { Component } from 'react'

export default class Detil extends Component {
    state={
        contexts:[
            {id:'1',context:'什么鬼啊！！！！'},
            {id:'2',context:'WTF!!!!!!!'},
            {id:'3',context:'纳尼！！！！！'},
        ]
    }
    
    render() {
        const {mid:id,mtitle:title} = this.props.match.params||{};
        const {context}=this.state.contexts.find(Arrobj=>{

            return Arrobj.id===id;
        })
        
        
        return (
            <div>
                <ul>
                    <li>ID:{id}</li>
                    <li>TITLE:{title}</li>
                    <li>CONTEXT:{context}</li>

                </ul>
            </div>
        )
    }
}
