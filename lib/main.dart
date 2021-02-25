import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

int value1 = 0;
int value2 = 0;
String method;
int answer = 0;

TextEditingController controller = TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  List<String> methodArray = ["+", "-", "/", "*", "="];

  void allClear() {
    setState(() {
      controller.text = "";
      method = null;
      value1 = 0;
      value2 = 0;
      answer = 0;
    });
  }

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
              child: GridView.builder(
                itemCount: number.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemBuilder: (BuildContext context, int index) {
                  return ButtonCulc(
                    value: number[index].toString(),
                    method: method,
                  );
                },
              ),
            ),
            Expanded(
                child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )),
            Expanded(
              child: FlatButton(
                onPressed: () => allClear(),
                child: Text(
                  "Clean",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: methodArray.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemBuilder: (BuildContext context, int index) {
                  return MethodWidget(
                    value: methodArray[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonCulc extends StatefulWidget {
  final String value;
  final method;

  ButtonCulc({
    Key key,
    this.value,
    this.method,
  }) : super(key: key);

  @override
  _ButtonCulcState createState() => _ButtonCulcState(value);
}

class _ButtonCulcState extends State<ButtonCulc> {
  final String value;
  _ButtonCulcState(this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new GridTile(
        child: FlatButton(
          onPressed: () => {
            setState(
              () {
                controller.text += value;
                if (method == null) {
                  value1 = int.parse(value1.toString() + value);
                } else {
                  value2 = int.parse(value2.toString() + value);
                }
              },
            )
          },
          child: Text(value),
        ),
      ),
    );
  }
}

class MethodWidget extends StatefulWidget {
  final value;

  const MethodWidget({Key key, this.value}) : super(key: key);

  @override
  _MethodWidgetState createState() => _MethodWidgetState();
}

class _MethodWidgetState extends State<MethodWidget> {
  void _setMethod(text) {
    setState(() {
      controller.text += text;

      method = text;
    });
  }

  void _answerClick() {
    setState(
      () {
        if (method == "+") {
          answer = value1 + value2;
        } else if (method == "-") {
          answer = value1 - value2;
        } else if (method == "/") {
          answer = value1 ~/ value2;
        } else if (method == "*") {
          answer = value1 * value2;
        }
        controller.text += '=' + answer.toString();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new GridTile(
        child: FlatButton(
          onPressed: () => {
            widget.value == "="
                ? this._answerClick()
                : this._setMethod(widget.value)
          },
          child: Text(
            widget.value,
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
