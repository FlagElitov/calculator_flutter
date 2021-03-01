import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:calculator/models/models_enum.dart';
import 'package:calculator/view/methods_list.dart';
import 'package:calculator/view/numbers_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({Key key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: BlocProvider(
        create: (context) {
          return CalculatorBloc();
        },
        child: BlocListener<CalculatorBloc, CalculatorState>(
          listener: (context, state) {
            if (state is CalculatorFailedState) {
              controller.text = '';
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<CalculatorBloc, CalculatorState>(
            builder: (context, state) {
              // ignore: close_sinks
              final provider = context.read<CalculatorBloc>();

              if (state is CalculatorSuccessState) {
                controller.text += '=' + state.stringAnswer;
              }
              if (state is AddInputValueState) {
                controller.text += state.value;
              }

              if (state is AddMethodState) {
                controller.text += getMethods(state.methods);
              }

              if (state is ClearCalculatorState) {
                controller.text = "";
              }

              if (state is RefreshCalculatorState) {
                provider.add(
                  RefreshCalculatorEvent(),
                );
              }

              return _Body(
                controller: controller,
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _Body extends StatelessWidget {
  final TextEditingController controller;

  _Body({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
          Expanded(child: _ClearButton()),
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
    );
  }
}

class _ClearButton extends StatelessWidget {
  _ClearButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final provider = context.read<CalculatorBloc>();

    return FlatButton(
      onPressed: () => provider.add(
        ClearAllEvent(),
      ),
      child: Text(
        "Clean",
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
}

class _EquelButton extends StatelessWidget {
  const _EquelButton({Key key}) : super(key: key);

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
              CalculateNumbersEvent(),
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
