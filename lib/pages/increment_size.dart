import 'package:flutter/material.dart';

class IncrementSize extends StatelessWidget {
  const IncrementSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Enter increment size',
          border: InputBorder.none,
          filled: true,
        ),
        onSubmitted: (String? value) {
          if (value != null && value.trim().isNotEmpty) {
            try {
              final incrementSize = int.parse(value);
            } on FormatException catch (e) {
              print(e.toString());
            }
          }
        },
      ),
    );
  }
}
