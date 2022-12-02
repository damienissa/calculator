import 'package:calculator/features/calculator/presentation/bloc/calculator_page_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorPageBloc>(
      create: (context) => CalculatorPageBloc(),
      child: const _CalculatorPageBody(),
    );
  }
}

class _CalculatorPageBody extends StatelessWidget {
  const _CalculatorPageBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorPageBloc, CalculatorPageState>(
      builder: (context, state) {
        final bloc = context.read<CalculatorPageBloc>();
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
                          style: const TextStyle(
                              fontSize: 48, color: Colors.white),
                          controller: bloc.textEditingController,
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
                          bloc.add(ClearFieldEvent());
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.grey[400]!,
                        title: '+/-',
                        onPressed: () {
                          bloc.add(ClearFieldEvent());
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.grey[400]!,
                        title: '%',
                        onPressed: () {
                          bloc.add(ClearFieldEvent());
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.amber,
                        title: '/',
                        onPressed: () {
                          bloc.add(ActionInputEvent(
                              action: CalculationActions.dilennya));
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
                          bloc.add(NumberInputEvent(num: 7));
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.grey[900]!,
                        title: '8',
                        onPressed: () {
                          bloc.add(NumberInputEvent(num: 8));
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.grey[900]!,
                        title: '9',
                        onPressed: () {
                          bloc.add(NumberInputEvent(num: 9));
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.amber,
                        title: '*',
                        onPressed: () {
                          bloc.add(ActionInputEvent(
                              action: CalculationActions.mnojennya));
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
                          bloc.add(NumberInputEvent(num: 4));
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.grey[900]!,
                        title: '5',
                        onPressed: () {
                          bloc.add(NumberInputEvent(num: 5));
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.grey[900]!,
                        title: '6',
                        onPressed: () {
                          bloc.add(NumberInputEvent(num: 6));
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.amber,
                        title: '-',
                        onPressed: () {
                          bloc.add(ActionInputEvent(
                              action: CalculationActions.vidnimannya));
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
                          bloc.add(NumberInputEvent(num: 1));
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.grey[900]!,
                        title: '2',
                        onPressed: () {
                          bloc.add(NumberInputEvent(num: 2));
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.grey[900]!,
                        title: '3',
                        onPressed: () {
                          bloc.add(NumberInputEvent(num: 3));
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.amber,
                        title: '+',
                        onPressed: () {
                          bloc.add(ActionInputEvent(
                              action: CalculationActions.dodavannya));
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
                          bloc.add(NumberInputEvent(num: 0));
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.grey[900]!,
                        title: ',',
                        onPressed: () {
                          bloc.add(DecimalInputEvent());
                        },
                      ),
                      ButtonCalculator(
                        color: Colors.amber,
                        title: '=',
                        onPressed: () {
                          bloc.add(ActionInputEvent(
                              action: CalculationActions.dorivnuye));
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
      },
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
  });
  final Color color;
  final String title;
  final bool doubled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: doubled ? 172 : 80,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 32,
              color: color == Colors.grey[400] ? Colors.black87 : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
