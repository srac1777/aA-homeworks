import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import addLoggingToDispatch from '../todo_redux';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState);
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
