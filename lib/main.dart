import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/calculator/presentation/calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator app',
      home: CalculatorPage(
        builder: (Calculator calculator) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        calculator.textEditingController.text,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CupertinoButton(
                        onPressed: () {},
                        child: const Text(
                          '0',
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.grey,
                              fontSize: 26),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {},
                        child: const Text(
                          ',',
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.grey,
                              fontSize: 26),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {},
                        child: const Text(
                          '=',
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.orange,
                              fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Це інтерфейс калькулятора. Тобто це те що уміє твій калькулятор.
// Ці методи ти можеш визивати по натисканню кнопок.
// До цих змінних ти можеш звертатися.
// Порада. Для роботи калькулятора потрібно 2 головних компонента.
//  - TextField для відображення результату
//  - CupertinoButton для кнопок
// Все інше це просто надлаштування над ними.
enum CalculationActions {
  dilennya,
  mnojennya,
  vidnimannya,
  dodavannya,
  dorivnuye;
}

abstract class Calculator {
  TextEditingController get textEditingController;
  CalculationActions? get currentAction;

  void clickOnAction(CalculationActions actions);
  void clickOnNumber(int number);
  void clickOnClear();
  void cliclOnComma();
}
