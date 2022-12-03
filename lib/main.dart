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
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: CalculatorPage(
          builder: (calculator) {
            return CalculatorPageBody(
              calculator: calculator,
            );
          },
        ));
  }
}
