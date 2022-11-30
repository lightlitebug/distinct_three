import 'counter_action.dart';

import 'counter_state.dart';

CounterState counterReducer(CounterState state, action) {
  if (action is IncrementAction) {
    return state.copyWith(counter: state.counter + action.incrementSize);
  }
  return state;
}
