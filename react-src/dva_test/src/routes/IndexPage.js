import React, { Component } from 'react'
import { connect } from 'dva';
import styles from './IndexPage.css';



 class IndexPage extends Component {
  setName=()=>{
    console.log(this.name.value);
    this.props.addName(this.name.value)
    
  }
  render() {
    return (
      <div className={styles.normal}>
      <h1 className={styles.title}>Yay!{this.props.name} Welcome to dva!</h1>
      <div className={styles.welcome} />
      <ul className={styles.list}>
        <li>To get started, edit <code>src/index.js</code> and save to reload.</li>
        <input type ='text' ref={c=>this.name=c}/>
        <button onClick={this.setName}>修改姓名</button>
        
      </ul>
    </div>
    )
  }
}



IndexPage.propTypes = {
};

export default connect((State) => {
  return {
      name:State.example.name
    }
  
},{
    addName:(name) => {
      return {type:'example/addName' ,data:name}
    }
})(IndexPage);
