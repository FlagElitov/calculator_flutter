part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {}

class CalculatorInitialState extends CalculatorState {}

class CalculatorSuccessState extends CalculatorState {
  final double answer;
  get stringAnswer => this.answer.toStringAsFixed(2);

  CalculatorSuccessState(this.answer);
}

class CalculatorFailedState extends CalculatorState {
  final String error;

  CalculatorFailedState(this.error);
}

class AddInputValueState extends CalculatorState {
  final String value;

  AddInputValueState(this.value);
}

class AddMethodState extends CalculatorState {
  final Method methods;
  AddMethodState(this.methods);
}

class ClearCalculatorState extends CalculatorState {}

class RefreshCalculatorState extends CalculatorState {}
