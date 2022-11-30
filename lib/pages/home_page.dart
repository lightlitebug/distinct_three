import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/app_state.dart';
import '../redux/counter/counter_action.dart';
import 'increment_size.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StoreConnector<AppState, _ViewModel>(
          distinct: true,
          converter: (Store<AppState> store) => _ViewModel.fromStore(store),
          builder: (BuildContext context, _ViewModel vm) {
            print('Building Column...');
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const IncrementSize(),
                const SizedBox(height: 20.0),
                Text(
                  'Increment Size: ${vm.incrementSize}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Counter: ${vm.counter}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    vm.incrementCounter(vm.incrementSize);
                  },
                  child: const Text(
                    'Increment',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ViewModel extends Equatable {
  final int incrementSize;
  final int counter;
  final void Function(int incrementSize) incrementCounter;
  const _ViewModel({
    required this.incrementSize,
    required this.counter,
    required this.incrementCounter,
  });

  @override
  List<Object> get props => [incrementSize, counter];

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      incrementSize: store.state.incrementSizeState.incrementSize,
      counter: store.state.counterState.counter,
      incrementCounter: (int incrementSize) {
        store.dispatch(
          IncrementAction(incrementSize: incrementSize),
        );
      },
    );
  }
}
