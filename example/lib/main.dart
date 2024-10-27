import 'package:flutter/material.dart';
import 'package:loading_state_handler/loading_state_handler.dart';

void main() {
  // Set default widgets for different states
  StateHandlerWidget.setDefaultWidgets(
    loadingBuilder: (context) =>
        const Center(child: CircularProgressIndicator()),
    errorBuilder: (context, errorMessage) => Center(
      child: Text('Custom Error: $errorMessage',
          style: const TextStyle(color: Colors.red)),
    ),
    emptyBuilder: (context) => const Center(child: Text('No Data Available')),
  );
  runApp(const MyApp());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool loading = true;
  bool error = false;
  bool empty = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Handler Example')),
      body: StateHandlerWidget(
        loading: loading,
        error: error,
        errorMessage: errorMessage,
        empty: empty,
        child: const Center(child: Text('Data Loaded Successfully!')),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Simulate a data fetch
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = false;
        // Uncomment to simulate an error
        // error = true;
        // errorMessage = "Failed to load data";
        // Uncomment to simulate an empty state
        // empty = true;
      });
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
