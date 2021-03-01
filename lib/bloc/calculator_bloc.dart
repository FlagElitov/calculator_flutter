import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:calculator/models/models_enum.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitialState());

  int value1 = 0;
  int value2 = 0;
  Method method;
  double answer = 0;

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is InputValueEvent) {
      final String value = event.value.toString();

      if (method == null) {
        value1 = int.parse(value1.toString() + event.value);
      } else {
        value2 = int.parse(value2.toString() + event.value);
      }
      yield AddInputValueState(value);
    }

    if (event is SetMethodsEvent) {
      method = event.method;

      yield AddMethodState(event.method);
    }

    if (event is CalculateNumbersEvent) {
      switch (method) {
        case Method.plus:
          answer = value1 + value2.toDouble();
          yield CalculatorSuccessState(answer);
          break;
        case Method.minus:
          answer = value1 - value2.toDouble();
          yield CalculatorSuccessState(answer);
          break;
        case Method.devide:
          answer = value1 / value2.toDouble();
          if (answer == double.infinity) {
            yield CalculatorSuccessState(answer = 0);
          } else {
            yield CalculatorSuccessState(answer);
          }
          break;
        case Method.mult:
          answer = value1 * value2.toDouble();
          yield CalculatorSuccessState(answer);
          break;
        default:
          yield CalculatorFailedState('Something wrong');
      }
    }

    if (event is ClearAllEvent) {
      method = null;
      value1 = 0;
      value2 = 0;
      answer = 0;

      yield ClearCalculatorState();
    }
    if (event is RefreshCalculatorEvent) {
      yield CalculatorInitialState();
    }
  }
}
