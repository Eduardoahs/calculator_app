import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String displayText = '0';
  String num1 = '';
  String num2 = '';
  String operand = '';
  bool isNewNum = true;

  void onButtonPressed(String value) {
    setState(() {
      final String logicValue = value == 'AC' ? 'CE' : value;

      if (logicValue == 'CE') {
        displayText = '0';
        num1 = '';
        num2 = '';
        operand = '';
        isNewNum = true;
      } else if (logicValue == 'C') {
        if (displayText.length > 1) {
          displayText = displayText.substring(0, displayText.length - 1);
        } else {
          displayText = '0';
          isNewNum = true;
        }
      } else if (logicValue == '%') {
        double currentVal = double.tryParse(displayText) ?? 0;
        currentVal = currentVal / 100;
        if (currentVal == currentVal.toInt()) {
          displayText = currentVal.toInt().toString();
        } else {
          displayText = currentVal.toString();
        }
      } else if ('+-×÷'.contains(logicValue)) {
        num1 = displayText;
        operand = logicValue;
        isNewNum = true;
      } else if (logicValue == '=') {
        if (num1.isNotEmpty && operand.isNotEmpty) {
          num2 = displayText;
          double n1 = double.tryParse(num1) ?? 0;
          double n2 = double.tryParse(num2) ?? 0;
          double result = 0;

          if (operand == '+') result = n1 + n2;
          if (operand == '-') result = n1 - n2;
          if (operand == '×') result = n1 * n2;
          if (operand == '÷') {
            if (n2 == 0) {
              displayText = 'Error';
              return;
            }
            result = n1 / n2;
          }

          if (result == result.toInt()) {
            displayText = result.toInt().toString();
          } else {
            displayText = result.toString();
          }
          num1 = '';
          operand = '';
          isNewNum = true;
        }
      } else {
        if (isNewNum) {
          displayText = logicValue == '.' ? '0.' : logicValue;
          isNewNum = false;
        } else {
          if (logicValue == '.' && displayText.contains('.')) return;
          displayText += logicValue;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Colors.black;
    const Color displayBgColor = Color(0xFF1C1C1E);
    const Color buttonBgColor = Color(0xFF2C2C2E);
    const Color accentColor = Color(0xFFF59E0B);
    const Color displayTextColor = Colors.white;
    final Color numButtonTextColor = Colors.grey[200]!;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Calculadora',
            style: TextStyle(color: accentColor, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: accentColor),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.info),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: displayBgColor,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(32),
              margin: const EdgeInsets.all(16),
              child: Text(
                displayText,
                style: const TextStyle(
                  color: displayTextColor,
                  fontSize: 80,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildButtonRow(['AC', 'C', '%', '÷'], buttonBgColor,
                      accentColor: accentColor),
                  const SizedBox(height: 12),
                  _buildButtonRow(['7', '8', '9', '×'], buttonBgColor,
                      accentColor: accentColor, textColor: numButtonTextColor),
                  const SizedBox(height: 12),
                  _buildButtonRow(['4', '5', '6', '-'], buttonBgColor,
                      accentColor: accentColor, textColor: numButtonTextColor),
                  const SizedBox(height: 12),
                  _buildButtonRow(['1', '2', '3', '+'], buttonBgColor,
                      accentColor: accentColor, textColor: numButtonTextColor),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCalcButton('0', buttonBgColor, numButtonTextColor,
                            flex: 2),
                        const SizedBox(width: 12),
                        _buildCalcButton('.', buttonBgColor, numButtonTextColor,
                            flex: 1),
                        const SizedBox(width: 12),
                        _buildCalcButton('=', accentColor, Colors.white,
                            flex: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> values, Color bgColor,
      {Color? accentColor, Color? textColor}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: values.map((value) {
          final isOperator = '+-×÷'.contains(value);
          final color = isOperator || value == 'AC' || value == 'C' || value == '%'
              ? accentColor
              : textColor;
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: _buildCalcButton(value, bgColor, color ?? Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCalcButton(String text, Color bgColor, Color textColor,
      {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          onPressed: () => onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: textColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}