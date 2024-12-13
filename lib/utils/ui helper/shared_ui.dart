import 'package:calci_fl/utils/ui%20helper/common_ui.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

Widget buildDisplay(
    BuildContext context, String inputString, String outputString) {
  return Container(
    height: UIHelper.kSize(context, 0.3, isHeight: true),
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF1C252F),
      borderRadius: BorderRadius.circular(16),
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            inputString,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            outputString,
            style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildButtons(List<List<String>> buttonLayout, Function onButtonPress) {
  return Expanded(
    child: Column(
      children: buttonLayout.map((row) {
        return Expanded(
          child: Row(
            children: row.map((element) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => onButtonPress(element),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getButtonColor(element),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Text(
                      element,
                      style: TextStyle(
                        fontSize: 22,
                        color: _getTextColor(element),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    ),
  );
}

Color _getButtonColor(String element) {
  if (element == "C" || element == "⌫") {
    return const Color(0xFFFF6F61); // Red for clear/backspace
  } else if (element == "=") {
    return const Color(0xFF4CAF50); // Green for equals
  } else if (checkIsOperator(element)) {
    return const Color(0xFF2196F3); // Blue for operators
  }
  return const Color(0xFF2C3A47); // Default button color
}

Color _getTextColor(String element) {
  if (element == "C" || element == "⌫" || element == "=") {
    return Colors.white;
  }
  return Colors.white70;
}

bool checkIsOperator(String ch) {
  return ch == "X" || ch == "/" || ch == "-" || ch == "+";
}

String evaluateExpression(String input) {
  input = input.replaceAll("X", "*");
  try {
    final expression = Expression.parse(input);
    const evaluator = ExpressionEvaluator();
    final result = evaluator.eval(expression, {});
    return result.toString();
  } catch (e) {
    return "Error";
  }
}
