part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

// ignore: must_be_immutable
class InputValueEvent extends CalculatorEvent {
  final value;
  TextEditingController controller;

  InputValueEvent(this.value, this.controller);
}

// ignore: must_be_immutable
class SetMethodsEvent extends CalculatorEvent {
  final Method method;
  TextEditingController controller;

  SetMethodsEvent(this.controller, this.method);
}

// ignore: must_be_immutable
class CalculateNumbersEvent extends CalculatorEvent {
  TextEditingController controller;

  CalculateNumbersEvent(this.controller);
}

// ignore: must_be_immutable
class ClearAllEvent extends CalculatorEvent {
  TextEditingController controller;

  ClearAllEvent(this.controller);
}

class RefreshCalculatorEvent extends CalculatorEvent {}
