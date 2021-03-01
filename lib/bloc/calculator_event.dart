part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

// ignore: must_be_immutable
class InputValueEvent extends CalculatorEvent {
  final String value;

  InputValueEvent(
    this.value,
  );
}

// ignore: must_be_immutable
class SetMethodsEvent extends CalculatorEvent {
  Method method;

  SetMethodsEvent(this.method);
}

// ignore: must_be_immutable
class CalculateNumbersEvent extends CalculatorEvent {
  CalculateNumbersEvent();
}

// ignore: must_be_immutable
class ClearAllEvent extends CalculatorEvent {
  ClearAllEvent();
}

class RefreshCalculatorEvent extends CalculatorEvent {}
