# LoadingStateHandlerWidget

A customizable Flutter widget for handling various loading states (loading, error, empty, and normal) in your application. This widget allows you to display different UIs based on the current state and provides hooks for additional actions.

## Features

- Displays different widgets based on the state: loading, error, empty, or normal.
- Customizable loading, error, and empty widgets.
- Global default widget builders and callbacks.
- Easy integration with Flutter applications.

## Installation

Add the following dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  loading_state_handler: ^1.0.7
```

or add it using `flutter pub add loading_state_handler`.

## Parameters

- `loading`: A boolean value indicating whether the widget is currently in the loading state.
- `error`: A boolean value indicating whether the widget is currently in the error state.
- `empty`: A boolean value indicating whether the widget is currently in the empty state.
- `errorMessage`: A string value containing the error message, if the widget is in the error state.
- `emptyMessage`: A string value containing the empty message, if the widget is in the empty state.
- `loadingMessage`: A string value containing the loading message, if the widget is in the loading state.

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:loading_state_handler/loading_state_handler.dart';

void main() {
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

```

## Customization

You can customize the loading, error, and empty widgets by providing your own widget implementations. Here’s how you can do that:

```dart
LoadingStateHandlerWidget(
  loading: isLoading,
  error: hasError,
  empty: isEmpty,
  loadingWidget: CustomLoadingWidget(), // Your custom loading widget
  errorWidget: CustomErrorWidget(),     // Your custom error widget
  emptyWidget: CustomEmptyWidget(),     // Your custom empty widget
  child: YourMainContentWidget(),       // The main content of your page
);
```