part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class InputValueEvent extends CalculatorEvent {
  final value;

  InputValueEvent(this.value);
}

class SetMethodsEvent extends CalculatorEvent {
  final Method method;

  SetMethodsEvent(this.method);
}

class CalculateNumbersEvent extends CalculatorEvent {
  CalculateNumbersEvent();
}

class ClearAllEvent extends CalculatorEvent {
  ClearAllEvent();
}
