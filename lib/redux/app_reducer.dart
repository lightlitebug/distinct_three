import 'app_state.dart';
import 'counter/counter_reducer.dart';
import 'increment_size/increment_size_reducer.dart';

AppState reducer(AppState state, action) {
  return AppState(
    counterState: counterReducer(state.counterState, action),
    incrementSizeState: incrementSizeReducer(state.incrementSizeState, action),
  );
}
