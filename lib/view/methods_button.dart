import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:calculator/models/models_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MethodsButton extends StatelessWidget {
  final TextEditingController controller;
  final Method method;

  const MethodsButton({Key key, this.controller, this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final provider = context.read<CalculatorBloc>();

    return Card(
      child: new GridTile(
        child: FlatButton(
          onPressed: () => provider.add(
            SetMethodsEvent(controller, method),
          ),
          child: Text(
            getMethods(method),
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
