import 'package:flutter/material.dart';
import 'package:loading_state_handler/loading_state_handler.dart';

void main() {
  // Set default widgets for different states
  LoadingStateHandlerWidget.setDefaultWidgets(
    defaultOnData: (context, message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message ?? 'Default Got Data...'),
        ),
      );
    },
    defaultOnLoading: (context, message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message ?? 'Default Loading...'),
        ),
      );
    },
    defaultLoadingBuilder: (context, loadingMessage) =>
        const Center(child: CircularProgressIndicator()),
    defaultErrorBuilder: (context, errorMessage) => Center(
      child: Text('Custom Error: $errorMessage',
          style: const TextStyle(color: Colors.red)),
    ),
    defaultEmptyBuilder: (context, emptyMessage) => const Center(
      child: Text('No Data Available'),
    ),
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
      appBar: AppBar(title: const Text('Loading State Handler Example')),
      body: LoadingStateHandlerWidget(
        loading: loading,
        onLoading: (defaultOnLoading, message) {
          // defaultOnLoading?.call(context, message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message ?? 'Custom Loading...'),
            ),
          );
        },
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
