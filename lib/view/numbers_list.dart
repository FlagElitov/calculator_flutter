import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:calculator/view/numbers_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumbersList extends StatelessWidget {
  const NumbersList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final provider = context.read<CalculatorBloc>();

    return GridView.builder(
      itemCount: provider.number.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemBuilder: (BuildContext context, int index) {
        return NumbersButton(
          value: provider.number[index].toString(),
          method: provider.method,
        );
      },
    );
  }
}
