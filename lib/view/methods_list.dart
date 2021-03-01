import 'package:calculator/models/models_enum.dart';
import 'package:calculator/view/methods_button.dart';
import 'package:flutter/material.dart';

class MethodsList extends StatelessWidget {
  final TextEditingController controller;
  MethodsList({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: Method.values.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return MethodsButton(
          method: Method.values[index],
        );
      },
    );
  }
}
