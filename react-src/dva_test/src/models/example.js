
export default {

  namespace: 'example',

  state: {name:'张三'},

  subscriptions: {
    setup({ dispatch, history }) {  // eslint-disable-line
    },
  },

  effects: {
    *fetch({ payload }, { call, put }) {  // eslint-disable-line
      yield put({ type: 'save' });
    },
  },

  reducers: {
    addName(state, action) {
      console.log(state);
      
      return {name:action.data}
    },
  },

};
