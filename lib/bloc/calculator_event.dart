part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class InputValueEvent extends CalculatorEvent {
  final value;
  TextEditingController controller = TextEditingController();

  InputValueEvent(this.value);
}

class SetMethodsEvent extends CalculatorEvent {
  final Method method;
  TextEditingController controller = TextEditingController();

  SetMethodsEvent(this.controller, this.method);
}

class CalculateNumbersEvent extends CalculatorEvent {
  TextEditingController controller = TextEditingController();

  CalculateNumbersEvent(this.controller);
}

class ClearAllEvent extends CalculatorEvent {
  TextEditingController controller = TextEditingController();

  ClearAllEvent(this.controller);
}
