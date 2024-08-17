import 'package:flutter/material.dart';
void main() => runApp(CalculatorApp());
class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorScreen(),
    );
  }
}
class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}
class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output += buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        if (num2 != 0) {
          _output = (num1 / num2).toString();
        } else {
          _output = "Error";
        }
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output += buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    }
    );
  }
  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(color: Colors.white, width: 1),
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Task Calculator',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.cyan,
            height: 200,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 54.0, horizontal: 122.0),
            child: Text(
              output,
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Container(
            color: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    buildButton("7", 1, Colors.grey),
                    buildButton("8", 1, Colors.grey),
                    buildButton("9", 1, Colors.grey),
                    buildButton("/", 1, Colors.amber),
                  ],
                ),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    buildButton("4", 1, Colors.grey),
                    buildButton("5", 1, Colors.grey),
                    buildButton("6", 1, Colors.grey),
                    buildButton("*", 1, Colors.amber),
                  ],
                ),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    buildButton("1", 1, Colors.grey),
                    buildButton("2", 1, Colors.grey),
                    buildButton("3", 1, Colors.grey),
                    buildButton("-", 1, Colors.amber),
                  ],
                ),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    buildButton(".", 1, Colors.grey),
                    buildButton("0", 1, Colors.grey),
                    buildButton("00", 1, Colors.grey),
                    buildButton("+", 1, Colors.amber),
                  ],
                ),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    buildButton("C", 1, Colors.red),
                    buildButton("=", 1, Colors.green),

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}