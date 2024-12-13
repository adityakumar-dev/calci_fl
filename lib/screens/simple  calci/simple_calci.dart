import 'package:calci_fl/utils/ui%20helper/shared_ui.dart';
import 'package:flutter/material.dart';

class SimpleCalci extends StatefulWidget {
  const SimpleCalci({super.key});

  @override
  State<SimpleCalci> createState() => _SimpleCalciState();
}

class _SimpleCalciState extends State<SimpleCalci> {
  String inputString = "";
  String outputString = "";

  final List<List<String>> buttonLayout = [
    ["C", "⌫", "/"], // First row
    ["7", "8", "9", "X"], // Second row
    ["4", "5", "6", "-"], // Third row
    ["1", "2", "3", "+"], // Fourth row
    [".", "0", "="], // Fifth row
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          buildDisplay(context, inputString, outputString),
          const SizedBox(height: 20),
          buildButtons(buttonLayout, onButtonPress),
        ],
      ),
    );
  }

  void onButtonPress(String element) {
    setState(() {
      if (element == "C") {
        inputString = "";
        outputString = "";
      } else if (element == "⌫") {
        if (inputString.isNotEmpty) {
          inputString = inputString.substring(0, inputString.length - 1);
        }
      } else if (element == "=") {
        try {
          outputString = evaluateExpression(inputString);
        } catch (e) {
          outputString = "Error";
        }
      } else if (checkIsOperator(inputString.isNotEmpty
              ? inputString[inputString.length - 1]
              : "") &&
          checkIsOperator(element)) {
        inputString =
            inputString.substring(0, inputString.length - 1) + element;
      } else {
        inputString += element;
      }
    });
  }
}
