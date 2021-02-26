import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:calculator/view/methods_list.dart';
import 'package:calculator/view/numbers_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CalculatorBloc();
      },
      child: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          return _Body();
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class _Body extends StatelessWidget {
  _Body({Key key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: NumbersList(),
            ),
            Expanded(
              child: TextField(
                readOnly: true,
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(child: _ClearButton(controller: controller)),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: MethodsList(),
                  ),
                  Expanded(
                    flex: 1,
                    child: _EquelButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClearButton extends StatelessWidget {
  final TextEditingController controller;

  _ClearButton({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final provider = context.read<CalculatorBloc>();

    return FlatButton(
      onPressed: () => provider.add(
        ClearAllEvent(controller),
      ),
      child: Text(
        "Clean",
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
}

class _EquelButton extends StatelessWidget {
  final TextEditingController controller;
  const _EquelButton({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final provider = context.read<CalculatorBloc>();

    return Container(
      height: 85,
      child: Card(
        child: new GridTile(
          child: FlatButton(
            onPressed: () => provider.add(
              CalculateNumbersEvent(controller),
            ),
            child: Text(
              '=',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
      ),
    );
  }
}
