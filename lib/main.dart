// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/calculator/presentation/calculator_page.dart';

void main() {
  runApp(const MyApp());
  // TODO: - В калькуляторі є змінна currentAction вона потрібна щоб був ефект як в реальному калькуляторі тіпа як кнопка нажата) Подумай як це можно зробить.
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
                    children: [
                      NumberButton(
                        title: '0',
                        action: () {
                          calculator.clickOnNumber(0);
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: ',',
                        action: () {
                          calculator.cliclOnComma();
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: '=',
                        action: () {
                          calculator
                              .clickOnAction(CalculationActions.dorivnuye);
                        },
                        color: CupertinoColors.activeOrange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NumberButton(
                        title: '1',
                        action: () {
                          calculator.clickOnNumber(1);
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: '2',
                        action: () {
                          calculator.clickOnNumber(2);
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: '3',
                        action: () {
                          calculator.clickOnNumber(3);
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: '+',
                        action: () {
                          calculator
                              .clickOnAction(CalculationActions.dodavannya);
                        },
                        color: CupertinoColors.activeOrange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NumberButton(
                        title: '4',
                        action: () {
                          calculator.clickOnNumber(4);
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: '5',
                        action: () {
                          calculator.clickOnNumber(5);
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: '6',
                        action: () {
                          calculator.clickOnNumber(6);
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: '-',
                        action: () {
                          calculator
                              .clickOnAction(CalculationActions.vidnimannya);
                        },
                        color: CupertinoColors.activeOrange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NumberButton(
                        title: '7',
                        action: () {
                          calculator.clickOnNumber(7);
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: '8',
                        action: () {
                          calculator.clickOnNumber(8);
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: '9',
                        action: () {
                          calculator.clickOnNumber(9);
                        },
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      NumberButton(
                        title: 'X',
                        action: () {
                          calculator
                              .clickOnAction(CalculationActions.mnojennya);
                        },
                        color: CupertinoColors.activeOrange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NumberButton(
                        title: 'AC',
                        action: () {
                          calculator.clickOnClear();
                        },
                        color: CupertinoColors.systemGrey,
                      ),
                      NumberButton(
                        title: '+/-',
                        action: () {},
                        color: CupertinoColors.systemGrey,
                      ),
                      NumberButton(
                        title: '%',
                        action: () {},
                        color: CupertinoColors.systemGrey,
                      ),
                      // TODO: - Ділення щас не в почете?
                      NumberButton(
                        title: '/',
                        action: () {},
                        color: CupertinoColors.activeOrange,
                      ),
                    ],
                  ),
                  // TODO: - добавить падінг щоб було красивіше.
                  // - Обернуть текст в ValueListenableBuilder це нужно шоб строчка обновлялась по любому ізмененію текста
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        calculator.textEditingController.text,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 70),
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

class NumberButton extends StatelessWidget {
  const NumberButton(
      {Key? key,
      required this.title,
      required this.action,
      required this.color})
      : super(key: key);
  final String title;
  final VoidCallback action;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
        padding: const EdgeInsets.all(8),
        onPressed: action,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
