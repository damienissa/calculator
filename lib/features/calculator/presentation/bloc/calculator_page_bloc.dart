import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'calculator_page_event.dart';
part 'calculator_page_state.dart';

class CalculatorPageBloc
    extends Bloc<CalculatorPageEvent, CalculatorPageState> {
  final TextEditingController textEditingController =
      TextEditingController(text: '0');

  final List<double> chain = [];

  CalculatorPageBloc() : super(CalculatorPageInitialState()) {
    on<NumberInputEvent>(_onNumberInputEvent);
    on<DecimalInputEvent>(_onDecimalInputEvent);
    on<ActionInputEvent>(_onActionInputEvent);
    on<ClearFieldEvent>(_onClearFieldEvent);
  }

  void _onNumberInputEvent(
      NumberInputEvent event, Emitter<CalculatorPageState> emit) {
    if (textEditingController.text == '0') {
      textEditingController.text = '';
    }
    textEditingController.text += event.num.toString();
  }

  void _onClearFieldEvent(
      ClearFieldEvent event, Emitter<CalculatorPageState> emit) {
    textEditingController.text = '0';
  }

  void _onDecimalInputEvent(
      DecimalInputEvent event, Emitter<CalculatorPageState> emit) {
    if (!textEditingController.text.contains(',')) {
      textEditingController.text += ',';
    }
  }

  void _onActionInputEvent(
      ActionInputEvent event, Emitter<CalculatorPageState> emit) {
    switch (event.action) {
      case CalculationActions.dilennya:
        return _onDilennya(emit);
      default:
    }
  }

  void _onDilennya(Emitter<CalculatorPageState> emit) {
    if (textEditingController.text.isEmpty ||
        textEditingController.text == '0') {
      return;
    }
    if (chain.isEmpty) {
      chain.add(double.parse(textEditingController.text));
      emit(CalculatorPageActionState(actions: CalculationActions.dilennya));
    }
  }
}
