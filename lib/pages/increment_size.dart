import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/app_state.dart';
import '../redux/increment_size/increment_size_action.dart';

class IncrementSize extends StatelessWidget {
  const IncrementSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel vm) {
          print('Building TextField...');
          return TextField(
            decoration: const InputDecoration(
              labelText: 'Enter increment size',
              border: InputBorder.none,
              filled: true,
            ),
            onSubmitted: (String? value) {
              if (value != null && value.trim().isNotEmpty) {
                try {
                  final incrementSize = int.parse(value);
                  vm.setIncrementSize(incrementSize);
                } on FormatException catch (e) {
                  print(e.toString());
                }
              }
            },
          );
        },
      ),
    );
  }
}

class _ViewModel extends Equatable {
  final void Function(int incrementSize) setIncrementSize;
  const _ViewModel({
    required this.setIncrementSize,
  });

  @override
  List<Object> get props => [];

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      setIncrementSize: (int incrementSize) {
        store.dispatch(SetIncrementSizeAction(incrementSize: incrementSize));
      },
    );
  }
}
