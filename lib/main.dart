import 'package:flutter/material.dart';

import 'features/calculator/presentation/bloc/calculator_page_bloc.dart';
import 'features/calculator/presentation/calculator_page.dart';

abstract class Calculator {
  TextEditingController get textEditingController;
  CalculationActions? get currentAction;

  void clickOnAction(CalculationActions actions);
  void clickOnNumber(int number);
  void clickOnClear();
  void cliclOnComma();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator app',
      home: CalculatorPage(
        builder: (calculator) {
          return CalculatorPageBody(
            calculator: calculator,
          );
        },
      ),
    );
  }
}
