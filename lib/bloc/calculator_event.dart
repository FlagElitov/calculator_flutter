part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class ClearAllEvent extends CalculatorEvent {
  final TextEditingController controller;

  ClearAllEvent(this.controller);
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

class ChoiceValueEvent extends CalculatorEvent {
  final TextEditingController controller;
  final value;

  ChoiceValueEvent(this.controller, this.value);
}
