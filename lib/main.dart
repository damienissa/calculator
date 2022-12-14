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
                verticalDirection: VerticalDirection.up,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            textAlign: TextAlign.center,
                            '0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            ',',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.activeOrange,
                          onPressed: () {},
                          child: const Text(
                            '=',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            textAlign: TextAlign.start,
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            textAlign: TextAlign.start,
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.activeOrange,
                          onPressed: () {},
                          child: const Text(
                            '+',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            textAlign: TextAlign.start,
                            '4',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            textAlign: TextAlign.start,
                            '5',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            '6',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.activeOrange,
                          onPressed: () {},
                          child: const Text(
                            '-',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            textAlign: TextAlign.start,
                            '7',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            textAlign: TextAlign.start,
                            '8',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.quaternarySystemFill,
                          onPressed: () {},
                          child: const Text(
                            '9',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(50),
                          color: CupertinoColors.activeOrange,
                          onPressed: () {},
                          child: const Text(
                            'X',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        calculator.textEditingController.text,
                        style: const TextStyle(color: Colors.white),
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
