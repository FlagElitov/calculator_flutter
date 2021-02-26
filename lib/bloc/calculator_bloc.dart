import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:calculator/models/models_enum.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial());

  List<int> number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  int value1 = 0;
  int value2 = 0;
  Method method;
  double answer = 0;

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is ClearAllEvent) {
      event.controller.text = "";
      method = null;
      value1 = 0;
      value2 = 0;
      answer = 0;
    }

    if (event is SetMethodsEvent) {
      event.controller.text += getMethods(event.method);
      method = event.method;
    }

    if (event is CalculateNumbersEvent) {
      switch (method) {
        case Method.plus:
          answer = value1.toDouble() + value2.toDouble();
          break;
        case Method.minus:
          answer = value1.toDouble() - value2.toDouble();
          break;
        case Method.devide:
          answer = value1.toDouble() / value2.toDouble();
          break;
        case Method.mult:
          answer = value1.toDouble() * value2.toDouble();
          break;
        case Method.eq:
          event.controller.text += '=' + answer.toString();
          break;
      }
    }
    if (event is ChoiceValueEvent) {
      event.controller.text += event.value.toString();
      if (method == null) {
        value1 = int.parse(value1.toString() + event.value);
      } else {
        value2 = int.parse(value2.toString() + event.value);
      }
    }
  }
}
