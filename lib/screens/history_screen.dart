import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Lịch sử"),
        backgroundColor: const Color(0xFF1E1E1E),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => provider.clearHistory(),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: provider.history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              provider.history[index],
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            subtitle: const Divider(color: Colors.grey),
          );
        },
      ),
    );
  }
}