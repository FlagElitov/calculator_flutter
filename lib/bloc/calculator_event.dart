part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class InputValueEvent extends CalculatorEvent {
  final TextEditingController controller;
  final value;

  InputValueEvent(this.controller, this.value);
}

class SetMethodsEvent extends CalculatorEvent {
  final TextEditingController controller;
  final Method method;

  SetMethodsEvent(this.controller, this.method);
}

class CalculateNumbersEvent extends CalculatorEvent {
  final TextEditingController controller;

  CalculateNumbersEvent(this.controller);
}

class ClearAllEvent extends CalculatorEvent {
  final TextEditingController controller;

  ClearAllEvent(this.controller);
}
