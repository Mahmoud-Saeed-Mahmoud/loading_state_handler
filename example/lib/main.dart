import 'package:flutter/material.dart';
import 'package:loading_state_handler/loading_state_handler.dart';

void main() {
  /// Sets the default widgets and callbacks to be used by all
  /// [LoadingStateHandlerWidget]s.
  ///
  /// The default widgets and callbacks will be used if the corresponding
  /// parameter of the [LoadingStateHandlerWidget] constructor is null.
  ///
  /// This function is useful if you want to set the default widgets and
  /// callbacks to be used by all [LoadingStateHandlerWidget]s in your app.
  ///
  /// The default widgets and callbacks can be set at any time, but it is
  /// recommended to set them before creating any [LoadingStateHandlerWidget]s.
  ///
  /// The default widgets and callbacks will be used until they are set again.
  ///
  /// The default widgets and callbacks are as follows:
  ///
  /// * [defaultLoadingBuilder]: The default loading widget builder.
  /// * [defaultErrorBuilder]: The default error widget builder.
  /// * [defaultEmptyBuilder]: The default empty widget builder.
  /// * [defaultOnError]: The default error callback.
  /// * [defaultOnEmpty]: The default empty callback.
  /// * [defaultOnLoading]: The default loading callback.
  /// * [defaultOnData]: The default data callback.
  LoadingStateHandlerWidget.setDefaults(
    /// Called when the widget is in the data state.
    ///
    /// The [context] parameter provides the location in the widget tree where this
    /// widget is being built.
    ///
    /// The [message] parameter is the message to be displayed in the widget.
    defaultOnData: (context, message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message ?? 'Default Got Data...'),
        ),
      );
    },

    /// Called when the widget is in the loading state.
    ///
    /// The [context] parameter provides the location in the widget tree where this
    /// widget is being built.
    ///
    /// The [message] parameter is the message to be displayed in the widget.
    defaultOnLoading: (context, message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message ?? 'Default Loading...'),
        ),
      );
    },

    /// The default loading widget builder.
    ///
    /// The [context] parameter provides the location in the widget tree where this
    /// widget is being built.
    ///
    /// The [loadingMessage] parameter is the message to be displayed in the widget.
    defaultLoadingBuilder: (context, loadingMessage) =>
        const Center(child: CircularProgressIndicator()),

    /// The default error widget builder.
    ///
    /// The [context] parameter provides the location in the widget tree where this
    /// widget is being built.
    ///
    /// The [errorMessage] parameter is the message to be displayed in the widget.
    defaultErrorBuilder:
        (context, errorMessage, retryWidget, retryCooldown, onRetry) => Center(
      child: Text(
        'Custom Error: $errorMessage',
        style: const TextStyle(color: Colors.red),
      ),
    ),

    /// The default empty widget builder.
    ///
    /// The [context] parameter provides the location in the widget tree where this
    /// widget is being built.
    ///
    /// The [emptyMessage] parameter is the message to be displayed in the widget.
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
        onLoading: (defaultOnLoading, context, message) {
          /// Uncomment to use the default loading callback
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
