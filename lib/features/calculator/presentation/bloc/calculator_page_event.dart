// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calculator_page_bloc.dart';

@immutable
abstract class CalculatorPageEvent extends Equatable {}

class ClearFieldEvent extends CalculatorPageEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NumberInputEvent extends CalculatorPageEvent {
  final int num;
  NumberInputEvent({
    required this.num,
  });

  @override
  List<Object?> get props => [num];
}

class DecimalInputEvent extends CalculatorPageEvent {
  @override
  List<Object?> get props => [];
}

class ActionInputEvent extends CalculatorPageEvent {
  final CalculationActions action;
  ActionInputEvent({
    required this.action,
  });

  @override
  List<Object?> get props => [action];
}
