/// Example demonstrating the usage of LoadingStateHandlerWidget with retry functionality.
///
/// This example shows how to:
/// 1. Set up global defaults for the widget
/// 2. Handle loading, error, and empty states
/// 3. Implement retry functionality with cooldown
/// 4. Customize messages and behaviors for different states
library;

import 'package:flutter/material.dart';
import 'package:loading_state_handler/loading_state_handler.dart';

///

/// LoadingStateHandlerWidget is a widget that handles loading, error, and empty
/// states of your app. It also provides retry functionality with cooldown.
///
/// The usage is simple: wrap your app with LoadingStateHandlerWidget and define
/// loading, error, and empty widgets. The widget will take care of showing the
/// correct widget depending on the state of your app.
///
/// The retry functionality is also built-in. You can customize the retry cooldown
/// and behavior.

void main() {
  // Set default widgets and retry cooldown globally for all instances
  // of LoadingStateHandlerWidget in the app
  LoadingStateHandlerWidget.setDefaults(
    defaultRetryCooldown: const Duration(seconds: 5),
    defaultErrorBuilder:
        (context, errorMessage, retryWidget, retryCooldown, onRetry) => Center(
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage ?? 'An error occurred'),
          retryWidget,
        ],
      ),
    ),
  );

  runApp(
    const MaterialApp(
      home: RetryExample(),
    ),
  );
}

/// A widget that demonstrates the various states and retry functionality
/// of the LoadingStateHandlerWidget.
///
/// This example simulates network requests with random failures and empty
/// states to showcase how the widget handles different scenarios.
class RetryExample extends StatefulWidget {
  const RetryExample({super.key});

  @override
  State<RetryExample> createState() => _RetryExampleState();
}

class _RetryExampleState extends State<RetryExample> {
  String? _errorMessage;
  bool _hasError = false;
  bool _isEmpty = false;
  // State flags to control the widget's behavior
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retry Example'),
      ),
      body: LoadingStateHandlerWidget(
        // State control properties
        loading: _isLoading,
        error: _hasError,
        empty: _isEmpty,

        // Custom messages for different states
        errorMessage: _errorMessage,
        emptyMessage: 'No data available',
        loadingMessage: 'Fetching data...',

        // Retry configuration
        enableRetry: true, // Enable the retry mechanism
        retryCooldown:
            const Duration(seconds: 3), // Custom cooldown per instance
        onRetry: () {
          // Callback executed when the retry button is pressed
          // This will be disabled during the cooldown period
          _fetchData();
        },

        // Content to display when in normal state (not loading/error/empty)
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Data loaded successfully!',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchData,
                child: const Text('Refresh Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Initial data fetch when the widget is first created
    _fetchData();
  }

  /// Simulates a network request with possible failure scenarios.
  ///
  /// This method demonstrates how to:
  /// 1. Handle the loading state
  /// 2. Handle errors with custom messages
  /// 3. Handle empty states
  /// 4. Update the UI based on the response
  ///
  /// The simulation includes:
  /// - 2 second delay to simulate network latency
  /// - 50% chance of failure (when second is even)
  /// - 33% chance of empty response (when second is divisible by 3)
  Future<void> _fetchData() async {
    // Set initial loading state
    setState(() {
      _isLoading = true;
      _hasError = false;
      _isEmpty = false;
      _errorMessage = null;
    });

    // Simulate network request with delay
    await Future.delayed(const Duration(seconds: 2));

    // Simulate random failure scenario
    if (DateTime.now().second % 2 == 0) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMessage = 'Failed to fetch data. Please try again.';
      });
      return;
    }

    // Simulate empty response scenario
    if (DateTime.now().second % 3 == 0) {
      setState(() {
        _isLoading = false;
        _isEmpty = true;
      });
      return;
    }

    // Success case - data loaded successfully
    setState(() {
      _isLoading = false;
    });
  }
}
