import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumbersButton extends StatelessWidget {
  final value;
  final method;

  const NumbersButton({
    Key key,
    this.value,
    this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final provider = context.read<CalculatorBloc>();
    return Card(
      child: new GridTile(
        child: FlatButton(
          onPressed: () => provider.add(
            InputValueEvent(value),
          ),
          child: Text(value),
        ),
      ),
    );
  }
}
