# LoadingStateHandlerWidget

A powerful Flutter widget for managing UI states with built-in retry functionality. This widget handles loading, error, empty, and normal states elegantly while providing a customizable retry mechanism with cooldown support.

## Features

- 🔄 Smart state management (loading, error, empty, normal)
- ⏲️ Built-in retry mechanism with configurable cooldown
- 🎨 Fully customizable widgets for each state
- 🌐 Global default configurations
- 📱 Easy integration with Flutter applications
- ⚡ Optimized performance with const constructor
- 🎯 Type-safe callbacks and builders

## Installation

Add the following dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  loading_state_handler: ^1.3.0
```

## Quick Start

```dart
// Set global defaults (optional)
LoadingStateHandlerWidget.setDefaults(
  defaultRetryCooldown: const Duration(seconds: 5),
  defaultLoadingBuilder: (context, message) => 
    const Center(child: CircularProgressIndicator()),
);

// Use in your widget
LoadingStateHandlerWidget(
  loading: isLoading,
  error: hasError,
  empty: isEmpty,
  errorMessage: 'Failed to load data',
  enableRetry: true,
  retryCooldown: const Duration(seconds: 3),
  onRetry: () => fetchData(),
  child: YourWidget(),
);
```

## Advanced Usage

### Retry Mechanism

The widget includes a sophisticated retry mechanism with cooldown:

```dart
LoadingStateHandlerWidget(
  error: true,
  errorMessage: 'Network error occurred',
  enableRetry: true,
  retryCooldown: const Duration(seconds: 3),
  onRetry: () async {
    await refetchData();
  },
  child: DataWidget(),
);
```

### Global Configuration

Set default behaviors for all instances:

```dart
LoadingStateHandlerWidget.setDefaults(
  defaultRetryCooldown: const Duration(seconds: 5),
  defaultLoadingBuilder: (context, message) => CustomLoadingWidget(),
  defaultErrorBuilder: (context, message) => CustomErrorWidget(),
  defaultEmptyBuilder: (context, message) => CustomEmptyWidget(),
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
    // Custom loading behavior
  },
  onError: (defaultCallback, context, message) {
    // Custom error handling
  },
  onEmpty: (defaultCallback, context, message) {
    // Custom empty state handling
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

## Properties

| Property | Type | Description |
|----------|------|-------------|
| `loading` | `bool` | Shows loading state when true |
| `error` | `bool` | Shows error state when true |
| `empty` | `bool` | Shows empty state when true |
| `currentState` | `CurrentStateEnum` | Current state of the widget |
| `errorTitle` | `String?` | Custom error title |
| `retryButtonStyle` | `ButtonStyle?` | Custom retry button style |
| `retryBtnTextStyle` | `TextStyle?` | Custom retry button text style |
| `retryMessageStyle` | `TextStyle?` | Custom retry message style |
| `retryBtnText` | `String?` | Custom retry button text |
| `retryMessage` | `String?` | Custom retry message |
| `loadingWidget` | `Widget?` | Custom loading widget |
| `errorWidget` | `Widget?` | Custom error widget |
| `emptyWidget` | `Widget?` | Custom empty widget |
| `disableWidgetChanges` | `bool` | Disables state changes in the widget |
| `disableErrorWidgetChanges` | `bool` | Disables state changes in the error widget |
| `disableEmptyWidgetChanges` | `bool` | Disables state changes in the empty widget |
| `enableRetry` | `bool` | Enables retry functionality |
| `retryCooldown` | `Duration` | Cooldown period between retries |
| `onRetry` | `VoidCallback` | Callback when retry is triggered |
| `errorMessage` | `String?` | Custom error message |
| `loadingMessage` | `String?` | Custom loading message |
| `emptyMessage` | `String?` | Custom empty state message |

## Example

Check out the [example](example/lib/main.dart.dart) and [example](example/lib/retry_example.dart) for a complete demonstration of all features.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.