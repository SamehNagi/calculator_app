import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
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
  Widget calcButton(String btnTxt, Color btnColor, Color txtColor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          // TODO add function for button press
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
            // Calculator display.
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '0',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
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
}
