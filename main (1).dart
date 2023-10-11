import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => HomePageState();
}

class HomePageState extends State<MyHomePage> {
  String output = '0';
  String Value = '0';
  double one = 0;
  double two = 0;
  String operator = "";
  String history = "";

  Widget Button(String buttonValue, int flexValue) {
    Color buttonColor = (buttonValue == "RESET")
        ? Colors.red
        : Color.fromARGB(255, 163, 138, 246);

    return Expanded(
      flex: flexValue,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
          ),
          onPressed: () {
            setState(() {
              if (buttonValue == 'RESET') {
                Value = '0';
                one = 0;
                two = 0;
                operator = "";
              } else if (buttonValue == '+' ||
                  buttonValue == '-' ||
                  buttonValue == 'x' ||
                  buttonValue == '/' ||
                  buttonValue == '%') {
                one = double.parse(output);
                operator = buttonValue;
                Value = '0';
              } else if (buttonValue == '.') {
                Value = Value + buttonValue;
              } else if (buttonValue == "=") {
                two = double.parse(output);

                if (operator == '+') {
                  Value = (one + two).toString();
                } else if (operator == '-') {
                  Value = (one - two).toString();
                } else if (operator == 'x') {
                  Value = (one * two).toString();
                } else if (operator == '/') {
                  Value = (one / two).toString();
                } else if (operator == '%') {
                  Value = (one % two).toString();
                }

                one = 0;
                two = 0;
                operator = "";
              } else {
                Value = Value + buttonValue;
              }
              setState(() {
                output = double.parse(Value).toStringAsFixed(2);
              });

              if (buttonValue != 'RESET') {
                history = history + buttonValue;
              } else {
                history = '';
              }
            });
          },
          child: Container(
            child: Text(
              buttonValue,
              style: const TextStyle(fontSize: 25, color: Colors.black),
            ),
            padding: const EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 41, 41, 37),
          width: 450.0,
          height: 600.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 41, 41, 37),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        child: Text(
                          history,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: Text(
                          output,
                          style: const TextStyle(
                            fontSize: 60,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Button("7", 1),
                      Button("8", 1),
                      Button("9", 1),
                      Button("x", 1),
                    ],
                  ),
                  Row(
                    children: [
                      Button("4", 1),
                      Button("5", 1),
                      Button("6", 1),
                      Button("+", 1),
                    ],
                  ),
                  Row(
                    children: [
                      Button("1", 1),
                      Button("2", 1),
                      Button("3", 1),
                      Button("-", 1),
                    ],
                  ),
                  Row(
                    children: [
                      Button("0", 1),
                      Button("%", 1),
                      Button("/", 2),
                    ],
                  ),
                  Row(
                    children: [
                      Button("RESET", 2),
                      Button("=", 2),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
