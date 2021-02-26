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
    List<int> number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

    return GridView.builder(
      itemCount: number.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemBuilder: (BuildContext context, int index) {
        return NumbersButton(
          value: number[index].toString(),
          method: provider.method,
        );
      },
    );
  }
}
