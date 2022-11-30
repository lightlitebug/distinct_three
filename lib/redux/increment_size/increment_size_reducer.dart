import 'increment_size_action.dart';
import 'increment_size_state.dart';

IncrementSizeState incrementSizeReducer(IncrementSizeState state, action) {
  if (action is SetIncrementSizeAction) {
    return state.copyWith(incrementSize: action.incrementSize);
  }
  return state;
}
