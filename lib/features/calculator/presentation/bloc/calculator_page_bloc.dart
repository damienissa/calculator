import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'calculator_page_event.dart';
part 'calculator_page_state.dart';

class CalculatorPageBloc
    extends Bloc<CalculatorPageEvent, CalculatorPageState> {
  final TextEditingController textEditingController =
      TextEditingController(text: '0');

  double counter = 0;
  bool clearOnNextNumber = false;

  CalculatorPageBloc() : super(CalculatorPageInitialState()) {
    on<NumberInputEvent>(_onNumberInputEvent);
    on<DecimalInputEvent>(_onDecimalInputEvent);
    on<ActionInputEvent>(_onActionInputEvent);
    on<ClearFieldEvent>(_onClearFieldEvent);
  }

  void _onNumberInputEvent(
      NumberInputEvent event, Emitter<CalculatorPageState> emit) {
    if (clearOnNextNumber || textEditingController.text == '0') {
      clearOnNextNumber = false;
      textEditingController.text = event.num.toString();
    } else {
      textEditingController.text += event.num.toString();
    }
  }

  void _onClearFieldEvent(
      ClearFieldEvent event, Emitter<CalculatorPageState> emit) {
    textEditingController.text = '0';
    counter = 0;
    emit(CalculatorPageInitialState());
  }

  void _onDecimalInputEvent(
      DecimalInputEvent event, Emitter<CalculatorPageState> emit) {
    if (!textEditingController.text.contains('.')) {
      textEditingController.text += '.';
    }
  }

  void _onActionInputEvent(
      ActionInputEvent event, Emitter<CalculatorPageState> emit) {
    clearOnNextNumber = true;
    switch (event.action) {
      case CalculationActions.dilennya:
      case CalculationActions.mnojennya:
      case CalculationActions.vidnimannya:
      case CalculationActions.dodavannya:
        _onActionArifmetic(event.action, emit);
        break;
      case CalculationActions.dorivnuye:
        _onDorivnyue(emit);
        break;
      default:
    }
  }

  void _onActionArifmetic(
      CalculationActions action, Emitter<CalculatorPageState> emit) {
    if (textEditingController.text.isEmpty ||
        textEditingController.text == '0') {
      return;
    }

    final current = double.parse(textEditingController.text);

    if (counter == 0) {
      counter = current;
      emit(CalculatorPageActionState(actions: action));
    } else {
      _applyArifmeticAction(action, current, emit);
    }
  }

  void _onDorivnyue(Emitter<CalculatorPageState> emit) {
    if (state is CalculatorPageActionState &&
        textEditingController.text != '0') {
      final current = double.parse(textEditingController.text);
      _applyArifmeticAction(
          (state as CalculatorPageActionState).actions, current, emit);
      counter = current;
    }
  }

  void _applyArifmeticAction(CalculationActions action, double value,
      Emitter<CalculatorPageState> emit) {
    switch (action) {
      case CalculationActions.dilennya:
        counter /= value;
        break;
      case CalculationActions.mnojennya:
        counter *= value;
        break;
      case CalculationActions.vidnimannya:
        counter -= value;
        break;
      case CalculationActions.dodavannya:
        counter += value;
        break;
      default:
    }

    textEditingController.text = counter.toString();
    emit(CalculatorPageInitialState());
  }
}
