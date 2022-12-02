import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'calculator_page_event.dart';
part 'calculator_page_state.dart';

class CalculatorPageBloc
    extends Bloc<CalculatorPageEvent, CalculatorPageState> {
  final TextEditingController textEditingController =
      TextEditingController(text: '0');

  CalculatorPageBloc() : super(CalculatorPageInitial()) {
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

  void _onDecimalInputEvent(
      DecimalInputEvent event, Emitter<CalculatorPageState> emit) {
    if (!textEditingController.text.contains(',')) {
      textEditingController.text += ',';
    }
  }

  void _onActionInputEvent(
      ActionInputEvent event, Emitter<CalculatorPageState> emit) {}

  void _onClearFieldEvent(
      ClearFieldEvent event, Emitter<CalculatorPageState> emit) {
    textEditingController.text = '0';
  }
}
