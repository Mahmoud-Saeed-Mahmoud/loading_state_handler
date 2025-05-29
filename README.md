# LoadingStateHandlerWidget

[![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)](https://dart.dev) [![Flutter](https://img.shields.io/badge/Dart-0175C2?logo=flutter&logoColor=white)](https://dart.dev) [![Pub Version](https://img.shields.io/pub/v/loading_state_handler)](https://pub.dev/packages/loading_state_handler) [![Pub Likes](https://img.shields.io/pub/likes/loading_state_handler)](https://img.shields.io/pub/likes/loading_state_handler) [![Pub Publisher](https://img.shields.io/pub/publisher/loading_state_handler)](https://img.shields.io/pub/publisher/loading_state_handler) ![Pub Points](https://img.shields.io/pub/points/loading_state_handler) ![Pub Monthly Downloads](https://img.shields.io/pub/dm/loading_state_handler) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

A powerful Flutter widget for managing UI states with built-in retry functionality. This widget handles loading, error, empty, and normal states elegantly while providing a customizable retry mechanism with cooldown support.

## Features

- 🔄 Smart state management (loading, error, empty, normal, data)
- ⏲️ Built-in retry mechanism with configurable cooldown
- 🎨 Fully customizable widgets for each state
- 🌐 Global default configurations
- ⚡ Optimized performance with const constructor
- 🎯 Type-safe callbacks and builders

## Installation

Run the following command to add the package to your project:

```bash
flutter pub add loading_state_handler
```

or add the package to your `pubspec.yaml` file:

```yml
dependencies:
  loading_state_handler: ^2.1.0
```

## Quick Start

```dart
// Set global defaults (optional)
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

// Use in your widget
LoadingStateHandlerWidget(
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
        errorMessage: errorMessage,
        child: const Center(child: Text('Data Loaded Successfully!')),
      );
```

## Advanced Usage

### Retry Mechanism

The widget includes a sophisticated retry mechanism with cooldown:

```dart
LoadingStateHandlerWidget(
        // State control properties
        currentState: _currentState,

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
      );
```

### Global Configuration

Set default behaviors for all instances:

```dart
LoadingStateHandlerWidget.setDefaults(
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

    defaultErrorBuilder:
        (context, errorMessage, retryWidget, retryCooldown, onRetry) => Center(
      child: Text(
        'Custom Error: $errorMessage',
        style: const TextStyle(color: Colors.red),
      ),
    ),

    defaultEmptyBuilder: (context, emptyMessage) => const Center(
      child: Text('No Data Available'),
    ),
  );
```

### State-Specific Callbacks

Handle different states with custom callbacks:

```dart
LoadingStateHandlerWidget(
  loading: isLoading,
  error: hasError,
  empty: isEmpty,
  onLoading: (defaultCallback, context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? 'Custom Loading...'),
      ),
    );
  },
  onError: (defaultCallback, context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? 'Custom Error...'),
      ),
    );
  },
  onEmpty: (defaultCallback, context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? 'Custom Empty...'),
      ),
    );
  },
  child: ContentWidget(),
);
```

### Disable State Changes

Control widget behavior granularly:

```dart
LoadingStateHandlerWidget(
  disableWidgetChanges: false,
  disableErrorWidgetChanges: true,
  disableEmptyWidgetChanges: false,
  // ... other properties
);
```

### State Change Callback

Track state transitions with the `onStateChange` callback:

```dart
LoadingStateHandlerWidget(
  currentState: currentState,
  onStateChange: (oldState, newState) {
    print('State changed from $oldState to $newState');
    // You can use this to log state transitions or trigger additional actions
  },
  child: YourContentWidget(),
);
```

### Custom Child Builder

Customize the child widget based on the current state:

```dart
LoadingStateHandlerWidget(
  currentState: currentState,
  childBuilder: (context, currentState, child) {
    // Add a colored border based on the current state
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _getStateColor(currentState),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: child, // The original child widget
    );
  },
  child: YourContentWidget(),
);

// Helper method to get color based on state
Color _getStateColor(CurrentStateEnum state) {
  switch (state) {
    case CurrentStateEnum.normal: return Colors.grey;
    case CurrentStateEnum.loading: return Colors.blue;
    case CurrentStateEnum.data: return Colors.green;
    case CurrentStateEnum.empty: return Colors.amber;
    case CurrentStateEnum.error: return Colors.red;
    default: return Colors.grey;
  }
}
```

## Properties

| Property                    | Type                             | Description                                                |
| --------------------------- | -------------------------------- | ---------------------------------------------------------- |
| `controller`                | `LoadingStateHandlerController?` | Controller instance used to manage the state of the widget |
| `currentState`              | `CurrentStateEnum`               | Current state of the widget                                |
| `onStateChange`             | `OnStateChange?`                 | Callback when state changes, provides old and new states   |
| `childBuilder`              | `ChildBuilder?`                  | Builder for customizing the child widget based on state    |
| `errorTitle`                | `String?`                        | Custom error title                                         |
| `retryButtonStyle`          | `ButtonStyle?`                   | Custom retry button style                                  |
| `retryButtonTextStyle`      | `TextStyle?`                     | Custom retry button text style                             |
| `retryMessageStyle`         | `TextStyle?`                     | Custom retry message style                                 |
| `retryButtonText`           | `String?`                        | Custom retry button text                                   |
| `retryMessage`              | `String?`                        | Custom retry message                                       |
| `loadingWidget`             | `Widget?`                        | Custom loading widget                                      |
| `errorWidget`               | `Widget?`                        | Custom error widget                                        |
| `emptyWidget`               | `Widget?`                        | Custom empty widget                                        |
| `disableWidgetChanges`      | `bool`                           | Disables state changes in the widget                       |
| `disableErrorWidgetChanges` | `bool`                           | Disables state changes in the error widget                 |
| `disableEmptyWidgetChanges` | `bool`                           | Disables state changes in the empty widget                 |
| `enableRetry`               | `bool`                           | Enables retry functionality                                |
| `retryCooldown`             | `Duration`                       | Cooldown period between retries                            |
| `onRetry`                   | `VoidCallback`                   | Callback when retry is triggered                           |
| `errorMessage`              | `String?`                        | Custom error message                                       |
| `loadingMessage`            | `String?`                        | Custom loading message                                     |
| `emptyMessage`              | `String?`                        | Custom empty state message                                 |

## Example

Check out the [example](example/lib/main.dart), [retry example](example/lib/retry_example.dart), and [controller example](example/lib/loading_state_handler_with_controller_example.dart) for a complete demonstration of all features.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
