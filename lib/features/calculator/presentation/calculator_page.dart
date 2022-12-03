import 'package:calculator/features/calculator/presentation/bloc/calculator_page_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';

typedef CalculatorBuilder = Widget Function(Calculator calculator);

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({
    super.key,
    required this.builder,
  });

  final CalculatorBuilder builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorPageBloc>(
      create: (context) => CalculatorPageBloc(),
      child: BlocBuilder<CalculatorPageBloc, CalculatorPageState>(
          builder: (context, state) {
        return builder(
          _Calculator(context: context),
        );
      }),
    );
  }
}

class CalculatorPageBody extends StatelessWidget {
  const CalculatorPageBody({super.key, required this.calculator});
  final Calculator calculator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextField(
                      style: const TextStyle(fontSize: 48, color: Colors.white),
                      controller: calculator.textEditingController,
                      textAlign: TextAlign.end,
                      enabled: false,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonCalculator(
                    color: Colors.grey[400]!,
                    title: 'AC',
                    onPressed: () {
                      calculator.clickOnClear();
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.grey[400]!,
                    title: 'AC',
                    onPressed: () {
                      calculator.clickOnClear();
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.grey[400]!,
                    title: 'AC',
                    onPressed: () {
                      calculator.clickOnClear();
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.amber,
                    title: '/',
                    isSelected:
                        calculator.currentAction == CalculationActions.dilennya,
                    onPressed: () {
                      calculator.clickOnAction(CalculationActions.dilennya);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: '7',
                    onPressed: () {
                      calculator.clickOnNumber(7);
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: '8',
                    onPressed: () {
                      calculator.clickOnNumber(8);
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: '9',
                    onPressed: () {
                      calculator.clickOnNumber(9);
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.amber,
                    title: '*',
                    isSelected: calculator.currentAction ==
                        CalculationActions.mnojennya,
                    onPressed: () {
                      calculator.clickOnAction(CalculationActions.mnojennya);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: '4',
                    onPressed: () {
                      calculator.clickOnNumber(4);
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: '5',
                    onPressed: () {
                      calculator.clickOnNumber(5);
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: '6',
                    onPressed: () {
                      calculator.clickOnNumber(6);
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.amber,
                    title: '-',
                    isSelected: calculator.currentAction ==
                        CalculationActions.vidnimannya,
                    onPressed: () {
                      calculator.clickOnAction(CalculationActions.vidnimannya);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: '1',
                    onPressed: () {
                      calculator.clickOnNumber(1);
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: '2',
                    onPressed: () {
                      calculator.clickOnNumber(2);
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: '3',
                    onPressed: () {
                      calculator.clickOnNumber(3);
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.amber,
                    title: '+',
                    isSelected: calculator.currentAction ==
                        CalculationActions.dodavannya,
                    onPressed: () {
                      calculator.clickOnAction(CalculationActions.dodavannya);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: '0',
                    doubled: true,
                    onPressed: () {
                      calculator.clickOnNumber(0);
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.grey[900]!,
                    title: ',',
                    onPressed: () {
                      calculator.cliclOnComma();
                    },
                  ),
                  ButtonCalculator(
                    color: Colors.amber,
                    title: '=',
                    onPressed: () {
                      calculator.clickOnAction(CalculationActions.dorivnuye);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonCalculator extends StatelessWidget {
  const ButtonCalculator({
    super.key,
    required this.color,
    required this.title,
    required this.onPressed,
    this.doubled = false,
    this.isSelected = false,
  });
  final Color color;
  final String title;
  final bool doubled;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: doubled ? 172 : 80,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 32,
              color: color == Colors.grey[400]
                  ? Colors.black87
                  : (isSelected ? color : Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class _Calculator extends Calculator {
  final BuildContext context;

  CalculatorPageBloc get bloc => context.read<CalculatorPageBloc>();
  @override
  CalculationActions? get currentAction =>
      (bloc.state is CalculatorPageActionState)
          ? (bloc.state as CalculatorPageActionState).actions
          : null;

  @override
  TextEditingController get textEditingController => bloc.textEditingController;

  _Calculator({
    required this.context,
  });

  @override
  void clickOnAction(CalculationActions actions) {
    bloc.add(ActionInputEvent(action: actions));
  }

  @override
  void clickOnClear() {
    bloc.add(ClearFieldEvent());
  }

  @override
  void clickOnNumber(int number) {
    bloc.add(NumberInputEvent(num: number));
  }

  @override
  void cliclOnComma() {
    bloc.add(DecimalInputEvent());
  }
}
