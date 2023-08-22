import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // New variable to store the operation being performed
  String operation = '';

  Widget calcButton(String btnTxt, Color btnColor, Color txtColor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          calculation(btnTxt);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(8),
        ),
        child: Text(
          btnTxt,
          style: TextStyle(
            fontSize: 35,
            color: txtColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Display the operation at the top
            Text(
              operation,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            // Calculator display.
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Here buttons functions will be called where we will pass
                // some arguments.
                // Note: When using Colors.grey[300], you're actually getting
                // the color from a Map which Dart (in null-safe mode) warns
                // you about because that value could be null.
                // So, either use the bang operator Colors.grey[750] OR shade
                // on the color.
                calcButton('AC', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            // Now we will copy the above row code and make more rows.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Here buttons functions will be called where we will pass
                // some arguments.
                calcButton('7', Colors.grey[850]!, Colors.white),
                calcButton('8', Colors.grey[850]!, Colors.white),
                calcButton('9', Colors.grey[850]!, Colors.white),
                calcButton('x', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            // Same as above, we will make more rows in similar way.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Here buttons functions will be called where we will pass
                // some arguments.
                calcButton('4', Colors.grey[850]!, Colors.white),
                calcButton('5', Colors.grey[850]!, Colors.white),
                calcButton('6', Colors.grey[850]!, Colors.white),
                calcButton('-', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            // Same as above, we will make more rows in similar way.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Here buttons functions will be called where we will pass
                // some arguments.
                calcButton('1', Colors.grey[850]!, Colors.white),
                calcButton('2', Colors.grey[850]!, Colors.white),
                calcButton('3', Colors.grey[850]!, Colors.white),
                calcButton('+', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            // Now last row is different as it has the 0 button.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // This is button 0
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[850]!,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(25, 8, 100, 8),
                  ),
                  child: const Text(
                    "0",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                calcButton('.', Colors.grey[850]!, Colors.white),
                calcButton('=', Colors.amber[700]!, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

// Calculator logic
  dynamic text = '0';
  double firstNum = 0;
  double secondNum = 0;
  dynamic finalResult = '';
  dynamic result = '';
  dynamic opr = '';

  void calculation(btnText) {
    if (btnText == 'AC') {
      // Resets all variables to their initial values, effectively resetting the calculator.
      resetCalculator();
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      // Update firstNum and secondNum
      if (firstNum == 0) {
        firstNum = double.parse(finalResult);
      } else {
        secondNum = double.parse(finalResult);
      }

      // Handle the arithmetic operation
      performOperation();

      opr = btnText;
      result = '';
    } else {
      // If the input is any other digit or operator, it appends the input
      // to the result.
      result += btnText;
      finalResult = result;
    }

    // In Flutter, the setState() method is used to notify the framework that
    // the internal state of a widget has changed and that the UI should be
    // rebuilt to reflect those changes. It's commonly used in the context of
    // stateful widgets.
    // Update the calculator's displayed text with the final result.
    setState(() {
      text = finalResult;
    });
  }

  void resetCalculator() {
    text = '0';
    firstNum = 0;
    secondNum = 0;
    finalResult = '0';
    result = '';
    opr = '';
  }

  void performOperation() {
    if (opr == '+') {
      finalResult = add();
    } else if (opr == '-') {
      finalResult = sub();
    } else if (opr == 'x') {
      finalResult = mul();
    } else if (opr == '/') {
      finalResult = div();
    }
  }

  String add() {
    result = (firstNum + secondNum).toString();
    // Updating firstNum with the result for future operations
    firstNum = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (firstNum - secondNum).toString();
    // Updating firstNum with the result for future operations
    firstNum = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (firstNum * secondNum).toString();
    // Updating firstNum with the result for future operations
    firstNum = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (firstNum / secondNum).toString();
    // Updating firstNum with the result for future operations
    firstNum = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
