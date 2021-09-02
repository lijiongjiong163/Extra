//引入connect 方法，用于连接UI组件和redux，需预先下载
import {connect} from 'react-redux'
//引入UI组件
import CountUI from '../../components/Count'
import { createDecreaseAction, createIncreaseAction } from '../../redux/count_action'

function mapStateToProps(state){
    return {count:state}
}

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

export default connect(mapStateToProps,mapDispatchToProps)(CountUI)

