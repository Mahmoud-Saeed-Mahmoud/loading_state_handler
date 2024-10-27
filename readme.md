# StateHandlerWidget

The `StateHandlerWidget` is a Flutter widget that simplifies the handling of different UI states in your applications. It provides a consistent way to display loading, error, empty, and normal states, allowing for clean and maintainable UI code.

## Features

- Displays different widgets based on the current state (loading, error, empty, or normal).
- Allows customization of state-specific widgets.
- Provides default builder functions to define a consistent look across your app.

## Usage

To use the `StateHandlerWidget`, you can include it in your widget tree as follows:

```dart
StateHandlerWidget(
  loading: isLoading, // true if loading
  error: hasError,    // true if an error occurred
  empty: isEmpty,     // true if there's no data
  loadingWidget: CustomLoadingWidget(), // optional custom loading widget
  errorWidget: CustomErrorWidget(),     // optional custom error widget
  emptyWidget: CustomEmptyWidget(),     // optional custom empty widget
  child: YourContentWidget(),            // widget to display when not loading, error, or empty
);
```

### Parameters

- `loading`: Set to `true` if the widget is currently loading.
- `error`: Set to `true` if the widget encountered an error.
- `empty`: Set to `true` if there is no data to display.
- `loadingWidget`: A custom widget to display while loading.
- `errorWidget`: A custom widget to display on error.
- `emptyWidget`: A custom widget to display when empty.
- `child`: The normal state widget to display when no other state is active.

### Setting Default Builders

You can define default widgets for loading, error, and empty states across your app:

```dart
StateHandlerWidget.setDefaultWidgets(
  loadingBuilder: (context) => CustomLoadingWidget(),
  errorBuilder: (context) => CustomErrorWidget(),
  emptyBuilder: (context) => CustomEmptyWidget(),
);
```

### Example

Here’s a complete example demonstrating how to use the `StateHandlerWidget`:

```dart
class ExampleScreen extends StatelessWidget {
  final bool isLoading = false; // Example loading state
  final bool hasError = false;  // Example error state
  final bool isEmpty = false;    // Example empty state

  @override
  Widget build(BuildContext context) {
    return StateHandlerWidget(
      loading: isLoading,
      error: hasError,
      empty: isEmpty,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item $index'));
        },
      ),
    );
  }
}
```

## Notes

- Ensure that only one of the states (`loading`, `error`, or `empty`) is set to `true` at any given time.
- The default widgets will be used if the respective widget parameters are not provided.

## Conclusion

The `StateHandlerWidget` is a powerful tool for managing different UI states in Flutter applications. It promotes code reuse and enhances the user experience by providing a clean way to handle various application states.
