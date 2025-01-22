/// Flutter code sample for LoadingStateHandlerWidget
///
/// This example shows how to use the LoadingStateHandlerWidget with a controller.
///
/// The [LoadingStateHandlerController] is used to control the state of the
/// widget. It is not necessary to use a [StatefulWidget] or trigger a rebuild
/// when changing the state of the widget.
///
/// The [LoadingStateHandlerWidget] takes a [controller] property which is an
/// instance of [LoadingStateHandlerController]. The [controller] is used to
/// control the state of the widget. The [controller] can be used to set the
/// state of the widget to [LoadingStateHandlerController.loading],
/// [LoadingStateHandlerController.error], [LoadingStateHandlerController.empty],
/// [LoadingStateHandlerController.data], or [LoadingStateHandlerController.normal].
///
/// The [LoadingStateHandlerWidget] also takes a [loadingMessage], [errorMessage],
/// [emptyMessage], and [enableRetry] property. The [loadingMessage],
/// [errorMessage], and [emptyMessage] properties are used to display a message
/// when the state of the widget is [LoadingStateHandlerController.loading],
/// [LoadingStateHandlerController.error], or [LoadingStateHandlerController.empty]
/// respectively. The [enableRetry] property is used to enable or disable the
/// retry button. If [enableRetry] is true, a retry button will be displayed
/// when the state of the widget is [LoadingStateHandlerController.error]. The
/// retry button will trigger the [onRetry] callback when pressed. The
/// [onRetry] callback is used to perform the retry logic.
///
/// In this example, the [LoadingStateHandlerWidget] is used to display a
/// loading message, an error message, an empty message, or a normal message
/// depending on the state of the widget. The [FloatingActionButton] is used
/// to change the state of the widget.

library;

import 'package:flutter/material.dart';
import 'package:loading_state_handler/loading_state_handler.dart';

void main() {
  LoadingStateHandlerWidget.setDefaults(
    defaultOnData: (context, message) =>
        ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$message'),
      ),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Create a [LoadingStateHandlerController] instance.
    final LoadingStateHandlerController controller =
        LoadingStateHandlerController(
            // optional initial state
            initialState: CurrentStateEnum
                .data); // no need to use a stateful widget or trigger a rebuild

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading State Handler'),
      ),
      body: Center(
        child: LoadingStateHandlerWidget(
          /// Pass the [LoadingStateHandlerController] instance to the [LoadingStateHandlerWidget].
          controller: controller,

          /// Set the loading message.
          loadingMessage: 'Loading Data',

          /// Set the error message.
          errorMessage: 'Failed to load data',

          /// Set the empty message.
          emptyMessage: 'No data available',

          /// Set the data message.
          dataMessage: 'Got data',

          /// Enable the retry button.
          enableRetry: true,

          /// Set the retry callback.
          onRetry: () {
            /// Perform retry logic here.
            controller.setLoading();
            Future.delayed(const Duration(seconds: 2), () {
              controller.setData();
            });
          },

          /// Set the child widget.
          child: const Text('Normal State'),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => controller.setLoading(),
            tooltip: 'Loading',
            child: const Icon(Icons.hourglass_bottom),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => controller.setError(),
            tooltip: 'Error',
            child: const Icon(Icons.error),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => controller.setEmpty(),
            tooltip: 'Empty',
            child: const Icon(Icons.hourglass_empty),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => controller.setData(),
            tooltip: 'Data',
            child: const Icon(Icons.check),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => controller.setNormal(),
            tooltip: 'Normal',
            child: const Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
