// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calculator_page_bloc.dart';

@immutable
abstract class CalculatorPageState extends Equatable {}

class CalculatorPageInitialState extends CalculatorPageState {
  @override
  List<Object?> get props => [];
}

class CalculatorPageActionState extends CalculatorPageState {
  final CalculationActions actions;
  CalculatorPageActionState({
    required this.actions,
  });
  @override
  List<Object?> get props => [actions];
}
