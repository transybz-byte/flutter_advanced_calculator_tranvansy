import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';
import '../widgets/display_area.dart';
import '../widgets/calculator_button.dart';
import 'history_screen.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Consumer<CalculatorProvider>(
          builder: (context, provider, child) => TextButton(
            onPressed: provider.toggleAngleMode,
            child: Text(
              provider.isRad ? "RAD" : "DEG",
              style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white70),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(flex: 3, child: DisplayArea()),
            const Divider(color: Colors.grey, thickness: 0.2),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: _buildButtons(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context, listen: false);
    
    final List<List<String>> buttons = [
      ['sin', 'cos', 'tan', 'log'],
      ['√', '(', ')', '^'],
      ['C', 'CE', 'π', '÷'],
      ['7', '8', '9', 'x'],
      ['4', '5', '6', '-'],
      ['1', '2', '3', '+'],
      ['±', '0', '.', '='],
    ];

    return Column(
      children: buttons.map((row) {
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row.map((text) {
              // Phối màu
              Color bgColor = const Color(0xFF333333); // Màu số (Xám đậm)
              Color txtColor = Colors.white;

              if (['C', 'CE'].contains(text)) {
                bgColor = const Color(0xFFA52A2A); // Đỏ
              } 
              else if (['÷', 'x', '-', '+', '='].contains(text)) {
                bgColor = const Color(0xFF4C7B4C); // Xanh lá
                txtColor = Colors.white;
              } 
              else if (['sin', 'cos', 'tan', 'log', '√', '(', ')', '^', 'π'].contains(text)) {
                bgColor = const Color(0xFF171717); // Đen nhạt (Hàm khoa học)
                txtColor = Colors.orangeAccent;
              }
              
              return CalculatorButton(
                text: text,
                fillColor: bgColor,
                textColor: txtColor,
                onTap: () => provider.onButtonPressed(text),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}