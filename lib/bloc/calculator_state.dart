part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {}

class CalculatorInitialState extends CalculatorState {}

class CalculatorSuccessState extends CalculatorState {
  final double answer;

  CalculatorSuccessState(this.answer);
}

class CalculatorFailedState extends CalculatorState {
  final String error;

  CalculatorFailedState(this.error);
}

class ClearCalculatorState extends CalculatorState {}

class RefreshCalculatorState extends CalculatorState {}
