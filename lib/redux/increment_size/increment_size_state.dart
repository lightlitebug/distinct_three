import 'package:equatable/equatable.dart';

class IncrementSizeState extends Equatable {
  final int incrementSize;
  const IncrementSizeState({
    required this.incrementSize,
  });

  factory IncrementSizeState.initial() =>
      const IncrementSizeState(incrementSize: 1);

  @override
  List<Object> get props => [incrementSize];

  @override
  String toString() => 'IncrementSize(incrementSize: $incrementSize)';

  IncrementSizeState copyWith({
    int? incrementSize,
  }) {
    return IncrementSizeState(
      incrementSize: incrementSize ?? this.incrementSize,
    );
  }
}
