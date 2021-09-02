
import reactDom from 'react-dom'
import { Provider } from 'react-redux'
import App from './App'
import store from './redux/store'

reactDom.render(
<Provider store={store}>
    <App/>
</Provider>
,document.getElementById("root"))
//有react-redux就不需要手动渲染了。react-redux会再state更新后自动渲染
// store.subscribe(() =>
// reactDom.render(<App/>,document.getElementById("root")))
