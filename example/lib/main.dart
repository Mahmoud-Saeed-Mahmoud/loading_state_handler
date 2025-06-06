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
  CurrentStateEnum currentState = CurrentStateEnum.normal;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading State Handler Example')),
      body: LoadingStateHandlerWidget(
        currentState: currentState,
        onLoading: (defaultOnLoading, context, message) {
          /// Uncomment to use the default loading callback
          // defaultOnLoading?.call(context, message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message ?? 'Custom Loading...'),
            ),
          );
        },
        onData: (defaultOnData, context, message) {
          defaultOnData?.call(context, message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message ?? 'Custom Got Data...'),
            ),
          );
        },
        // Demonstrate the new onStateChange callback
        onStateChange: (oldState, newState) {
          debugPrint('State changed from $oldState to $newState');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('State changed from $oldState to $newState'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        // Demonstrate the new childBuilder
        childBuilder: (context, currentState, child) {
          // Add a colored border based on the current state
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: _getBorderColor(currentState),
                width: 4.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            child: child,
          );
        },
        errorMessage: errorMessage,
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
        currentState = CurrentStateEnum.data;
        // Uncomment to simulate an error
        // currentState = CurrentStateEnum.error;
        // errorMessage = "Failed to load data";
        // Uncomment to simulate an empty state
        // currentState = CurrentStateEnum.empty;
      });
    });
  }

  // Helper method to get border color based on current state
  Color _getBorderColor(CurrentStateEnum state) {
    switch (state) {
      case CurrentStateEnum.normal:
        return Colors.grey;
      case CurrentStateEnum.loading:
        return Colors.blue;
      case CurrentStateEnum.data:
        return Colors.green;
      case CurrentStateEnum.empty:
        return Colors.amber;
      case CurrentStateEnum.error:
        return Colors.red;
    }
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
