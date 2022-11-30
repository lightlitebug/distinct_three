import 'package:equatable/equatable.dart';

import 'counter/counter_state.dart';
import 'increment_size/increment_size_state.dart';

class AppState extends Equatable {
  final CounterState counterState;
  final IncrementSizeState incrementSizeState;
  const AppState({
    required this.counterState,
    required this.incrementSizeState,
  });

  factory AppState.initial() {
    return AppState(
      counterState: CounterState.initial(),
      incrementSizeState: IncrementSizeState.initial(),
    );
  }

  @override
  List<Object> get props => [counterState, incrementSizeState];

  @override
  String toString() =>
      'AppState(counterState: $counterState, incrementSizeState: $incrementSizeState)';

  AppState copyWith({
    CounterState? counterState,
    IncrementSizeState? incrementSizeState,
  }) {
    return AppState(
      counterState: counterState ?? this.counterState,
      incrementSizeState: incrementSizeState ?? this.incrementSizeState,
    );
  }
}
