import 'package:flutter/material.dart';

class StateHandlerWidget extends StatelessWidget {
  /// Default widgets for the different states.
  ///
  /// These can be set at app start to provide a consistent look and feel.
  static Widget Function(BuildContext)? _defaultLoadingBuilder;
  static Widget Function(BuildContext)? _defaultErrorBuilder;
  static Widget Function(BuildContext)? _defaultEmptyBuilder;

  /// The state of the widget.
  ///
  /// The widget will be in one of the following states:
  ///
  /// * loading: The widget is currently loading.
  /// * error: The widget encountered an error.
  /// * empty: The widget has no data to display.
  /// * normal: The widget is in a normal state.
  final bool loading;
  final bool error;
  final bool empty;

  /// The widget to display when the state is loading.
  final Widget? loadingWidget;

  /// The widget to display when the state is error.
  final Widget? errorWidget;

  /// The widget to display when the state is empty.
  final Widget? emptyWidget;

  /// The widget to display when the state is normal.
  final Widget child;

  /// Creates a new [StateHandlerWidget].
  ///
  /// The [loading], [error] and [empty] properties are mutually exclusive.
  /// Only one of them can be true at any given time.
  ///
  /// The [loadingWidget], [errorWidget] and [emptyWidget] properties are used
  /// when the corresponding state is true.
  ///
  /// The [child] property is used when all the states are false.
  const StateHandlerWidget({
    super.key,
    required this.loading,
    this.error = false,
    this.empty = false,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    required this.child,
  });

  @override

  /// Returns the widget to display based on the state of the widget.
  //
  /// * If [empty] is true, returns the [emptyWidget] if it is not null,
  ///   otherwise the default empty widget if it has been set, otherwise a
  ///   simple text widget with the text 'Empty'.
  //
  /// * If [loading] is true, returns the [loadingWidget] if it is not null,
  ///   otherwise the default loading widget if it has been set, otherwise a
  ///   simple circular progress indicator.
  //
  /// * If [error] is true, returns the [errorWidget] if it is not null,
  ///   otherwise the default error widget if it has been set, otherwise a
  ///   simple text widget with the text 'Error'.
  //
  /// * If none of the above are true, returns the [child] widget.
  Widget build(BuildContext context) {
    return empty
        ? emptyWidget ??
            _defaultEmptyBuilder?.call(context) ??
            const Text('Empty')
        : loading
            ? loadingWidget ??
                _defaultLoadingBuilder?.call(context) ??
                const CircularProgressIndicator.adaptive()
            : error
                ? errorWidget ??
                    _defaultErrorBuilder?.call(context) ??
                    const Text('Error')
                : child;
  }

  /// Sets the default builder functions for the different states.
  ///
  /// These builder functions can be used to provide default widgets for the
  /// loading, error, and empty states across the app.
  ///
  /// If a specific builder function is provided, it will be used as the default
  /// for that state. If a builder function is not provided, the previous default
  /// (if any) will remain unchanged.
  ///
  /// [loadingBuilder] is the default builder for the loading state.
  /// [errorBuilder] is the default builder for the error state.
  /// [emptyBuilder] is the default builder for the empty state.
  static void setDefaultWidgets({
    Widget Function(BuildContext)? loadingBuilder,
    Widget Function(BuildContext)? errorBuilder,
    Widget Function(BuildContext)? emptyBuilder,
  }) {
    _defaultLoadingBuilder = loadingBuilder;
    _defaultErrorBuilder = errorBuilder;
    _defaultEmptyBuilder = emptyBuilder;
  }
}
