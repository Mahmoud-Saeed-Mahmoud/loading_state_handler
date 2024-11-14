import 'package:flutter/material.dart';

/// A widget that handles loading, error, and empty states.
///
class LoadingStateHandlerWidget extends StatefulWidget {
  /// Default loading widget builder.
  ///
  /// This callback will be called when [loading] is true, and the default
  /// widget is displayed.
  ///
  /// The default implementation is to display a [CircularProgressIndicator] in
  /// the center of the screen.
  ///
  /// If not null, the default loading widget will be displayed when [loading] is
  /// true.
  ///
  /// The default value is null, which means the default loading widget will not
  /// be displayed.
  static Widget Function(BuildContext, String?)? _defaultLoadingBuilder;

  /// Default error widget builder.
  ///
  /// This callback will be called when [error] is true, and the default
  /// widget is displayed.
  ///
  /// The default implementation is to display a [Text] widget in the center of
  /// the screen with the error message.
  ///
  /// If not null, the default error widget will be displayed when [error] is
  /// true.
  ///
  /// The default value is null, which means the default error widget will not
  /// be displayed.
  static Widget Function(BuildContext, String?)? _defaultErrorBuilder;

  /// Default empty widget builder.
  ///
  /// This callback will be called when [empty] is true, and the default
  /// widget is displayed.
  ///
  /// The default implementation is to display a [Text] widget in the center of
  /// the screen with the empty message.
  ///
  /// If not null, the default empty widget will be displayed when [empty] is
  /// true.
  ///
  /// The default value is null, which means the default empty widget will not
  /// be displayed.
  static Widget Function(BuildContext, String?)? _defaultEmptyBuilder;

  /// Default on loading callback.
  ///
  /// This callback will be called when [loading] is true.
  ///
  /// If not null, the default on loading callback will be called when [loading]
  /// is true.
  ///
  /// The default value is null, which means the default on loading callback will
  /// not be called.
  static void Function(BuildContext, String?)? _defaultOnLoading;

  /// Default on error callback.
  ///
  /// This callback will be called when [error] is true.
  ///
  /// If not null, the default on error callback will be called when [error] is
  /// true.
  ///
  /// The default value is null, which means the default on error callback will
  /// not be called.
  static void Function(BuildContext, String?)? _defaultOnError;

  /// Default on empty callback.
  ///
  /// This callback will be called when [empty] is true.
  ///
  /// If not null, the default on empty callback will be called when [empty] is
  /// true.
  ///
  /// The default value is null, which means the default on empty callback will
  /// not be called.
  static void Function(BuildContext, String?)? _defaultOnEmpty;

  /// Default on data callback.
  ///
  /// This callback will be called when [loading] is false, [error] is false,
  /// and [empty] is false.
  ///
  /// If not null, the default on data callback will be called when [loading] is
  /// false, [error] is false, and [empty] is false.
  ///
  /// The default value is null, which means the default on data callback will
  /// not be called.
  static void Function(BuildContext, String?)? _defaultOnData;

  /// To disable widget changes globally.
  ///
  /// If set to true, widget changes will be disabled globally.
  ///
  /// The default value is false, which means widget changes are enabled globally.
  static bool? _disableWidgetChanges;

  /// To disable error widget changes globally.
  ///
  /// If set to true, error widget changes will be disabled globally.
  ///
  /// The default value is false, which means error widget changes are enabled globally.
  static bool? _disableErrorWidgetChanges;

  /// To disable empty widget changes globally.
  ///
  /// If set to true, empty widget changes will be disabled globally.
  ///
  /// The default value is false, which means empty widget changes are enabled globally.
  static bool? _disableEmptyWidgetChanges;

  /// To disable widget changes.
  ///
  /// If set to true, widget changes will be disabled.
  ///
  /// The default value is false, which means widget changes are enabled.
  final bool disableWidgetChanges;

  /// To disable error widget changes.
  ///
  /// If set to true, error widget changes will be disabled.
  ///
  /// The default value is false, which means error widget changes are enabled.
  final bool disableErrorWidgetChanges;

  /// To disable empty widget changes.
  ///
  /// If set to true, empty widget changes will be disabled.
  ///
  /// The default value is false, which means empty widget changes are enabled.

  final bool disableEmptyWidgetChanges;

  /// Whether the widget is in a loading state.
  final bool loading;

  /// Whether the widget is in an error state.
  final bool error;

  /// Whether the widget is in an empty state.
  final bool empty;

  /// The error message.
  final String? errorMessage;

  /// The empty message.
  final String? emptyMessage;

  /// The loading message.
  final String? loadingMessage;

  /// The data message.
  final String? dataMessage;

  /// The widget to display when the state is loading.
  ///
  /// If not null, the [loadingWidget] will be displayed when [loading] is true.
  ///
  /// The default value is null, which means the default loading widget will be
  /// used.
  final Widget? loadingWidget;

  /// The widget to display when the state is error.
  ///
  /// If not null, the [errorWidget] will be displayed when [error] is true.
  ///
  /// The default value is null, which means the default error widget will be
  /// used.
  final Widget? errorWidget;

  /// The widget to display when the state is empty.
  ///
  /// If not null, the [emptyWidget] will be displayed when [empty] is true.
  ///
  /// The default value is null, which means the default empty widget will be
  /// used.
  final Widget? emptyWidget;

  /// The widget to display when the state is normal.
  ///
  /// This widget will be displayed when [loading] is false, [error] is false,
  /// and [empty] is false.
  final Widget child;

  /// A callback function that will be called when the state is error.
  ///
  /// The callback function takes two parameters, the default error widget
  /// function and the error message.
  ///
  /// The default error widget function will be passed to the callback function
  /// and can be used to generate the error widget.
  ///
  /// The error message will be passed to the callback function and can be used
  /// to display the error message.
  ///
  /// The default value is null, which means the default error widget will be
  /// used.
  final Function(
    Function(BuildContext, String?)?,
    String?,
  )? onError;

  /// A callback function that will be called when the state is empty.
  ///
  /// The callback function takes two parameters, the default empty widget
  /// function and the empty message.
  ///
  /// The default empty widget function will be passed to the callback function
  /// and can be used to generate the empty widget.
  ///
  /// The empty message will be passed to the callback function and can be used
  /// to display the empty message.
  ///
  /// The default value is null, which means the default empty widget will be
  /// used.
  final Function(
    Function(BuildContext, String?)?,
    String?,
  )? onEmpty;

  /// A callback function that will be called when the state is loading.
  ///
  /// The callback function takes two parameters, the default loading widget
  /// function and the loading message.
  ///
  /// The default loading widget function will be passed to the callback function
  /// and can be used to generate the loading widget.
  ///
  /// The loading message will be passed to the callback function and can be used
  /// to display the loading message.
  ///
  /// The default value is null, which means the default loading widget will be
  /// used.
  final Function(
    Function(BuildContext, String?)?,
    String?,
  )? onLoading;

  /// A callback function that will be called when the state is normal.
  ///
  /// The callback function takes two parameters, the default data widget
  /// function and the data message.
  ///
  /// The default data widget function will be passed to the callback function
  /// and can be used to generate the data widget.
  ///
  /// The data message will be passed to the callback function and can be used
  /// to display the data message.
  ///
  /// The default value is null, which means the default data widget will be
  /// used.
  final Function(
    Function(BuildContext, String?)?,
    String?,
  )? onData;
  const LoadingStateHandlerWidget({
    super.key,
    this.disableWidgetChanges = false,
    this.disableErrorWidgetChanges = false,
    this.disableEmptyWidgetChanges = false,
    required this.loading,
    this.error = false,
    this.empty = false,
    this.errorMessage,
    this.emptyMessage,
    this.loadingMessage,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.dataMessage,
    this.onEmpty,
    this.onError,
    this.onLoading,
    this.onData,
    required this.child,
  });

  /// Creates the state for the [LoadingStateHandlerWidget].
  @override
  State<LoadingStateHandlerWidget> createState() =>
      _LoadingStateHandlerWidgetState();

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
  static void setDefaultWidgets({
    bool? disableWidgetChanges,
    bool? disableErrorWidgetChanges,
    bool? disableEmptyWidgetChanges,
    Widget Function(BuildContext, String?)? defaultLoadingBuilder,
    Widget Function(BuildContext, String?)? defaultErrorBuilder,
    Widget Function(BuildContext, String?)? defaultEmptyBuilder,
    Function(BuildContext, String?)? defaultOnError,
    Function(BuildContext, String?)? defaultOnEmpty,
    Function(BuildContext, String?)? defaultOnLoading,
    Function(BuildContext, String?)? defaultOnData,
  }) {
    _disableWidgetChanges = disableWidgetChanges ?? false;
    _disableErrorWidgetChanges = disableErrorWidgetChanges ?? false;
    _disableEmptyWidgetChanges = disableEmptyWidgetChanges ?? false;

    _defaultLoadingBuilder = defaultLoadingBuilder;
    _defaultErrorBuilder = defaultErrorBuilder;
    _defaultEmptyBuilder = defaultEmptyBuilder;

    _defaultOnError = defaultOnError;
    _defaultOnEmpty = defaultOnEmpty;
    _defaultOnLoading = defaultOnLoading;
    _defaultOnData = defaultOnData;
  }
}

/// The state for the [LoadingStateHandlerWidget].
class _LoadingStateHandlerWidgetState extends State<LoadingStateHandlerWidget> {
  @override

  /// Builds the widget tree for the [LoadingStateHandlerWidget].
  ///
  /// This method first checks if [disableWidgetChanges] is true. If it is,
  /// the method simply returns the [child] widget.
  ///
  /// If [disableWidgetChanges] is false, the method checks the state of the
  /// [LoadingStateHandlerWidget] and returns the appropriate widget based on
  /// the state.
  ///
  /// If [loading] is true, the method returns the [loadingWidget] if it is not
  /// null, otherwise it returns the default loading widget which is a
  /// [Center] widget with a [CircularProgressIndicator].
  ///
  /// If [error] is true, the method returns the [errorWidget] if it is not null,
  /// otherwise it returns the default error widget which is a [Center] widget
  /// with the text 'Error'.
  ///
  /// If [empty] is true, the method returns the [emptyWidget] if it is not null,
  /// otherwise it returns the default empty widget which is a [Center] widget
  /// with the text 'Empty'.
  ///
  /// If the state is normal, the method returns the [child] widget.
  Widget build(BuildContext context) {
    if (widget.disableWidgetChanges) {
      return widget.child;
    } else {
      if (widget.loading) {
        return widget.loadingWidget ??
            LoadingStateHandlerWidget._defaultLoadingBuilder
                ?.call(context, widget.loadingMessage) ??
            const Center(
              child: CircularProgressIndicator(),
            );
      } else if (widget.error) {
        if (widget.disableErrorWidgetChanges ||
            (LoadingStateHandlerWidget._disableErrorWidgetChanges ?? false)) {
          return widget.child;
        }
        return widget.errorWidget ??
            LoadingStateHandlerWidget._defaultErrorBuilder
                ?.call(context, widget.errorMessage) ??
            const Center(
              child: Text('Error'),
            );
      } else if (widget.empty) {
        if (widget.disableEmptyWidgetChanges ||
            (LoadingStateHandlerWidget._disableEmptyWidgetChanges ?? false)) {
          return widget.child;
        }
        return widget.emptyWidget ??
            LoadingStateHandlerWidget._defaultEmptyBuilder
                ?.call(context, widget.emptyMessage) ??
            const Center(
              child: Text('Empty'),
            );
      } else {
        return widget.child;
      }
    }
  }

  @override

  /// Called when this widget is updated with a new configuration.
  ///
  /// This method is invoked when the widget is rebuilt with a new instance but
  /// with the same runtimeType. It allows the widget to update its internal
  /// state to reflect the new configuration.
  ///
  /// The [oldWidget] parameter contains the previous configuration of this
  /// widget. If necessary, you can compare it to the current widget to determine
  /// what has changed.
  ///
  /// In this implementation, a post-frame callback is added to apply any
  /// updated methods after the current frame is rendered, ensuring that the
  /// widget tree reflects the latest changes.
  void didUpdateWidget(covariant LoadingStateHandlerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _applyMethods(),
    );
  }

  @override

  /// Initializes the state of the [LoadingStateHandlerWidget].
  ///
  /// This method is responsible for applying the methods in the next frame.
  /// This is necessary to ensure that the current widget tree is updated before
  /// updating the methods.
  ///
  /// The method adds a post-frame callback to apply the methods in the next
  /// frame. When the callback is called, the [_applyMethods] function is called
  /// to apply the methods.
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _applyMethods(),
    );
  }

  /// Applies the methods provided in the [LoadingStateHandlerWidget].
  ///
  /// This function is called in the next frame after the widget is updated.
  /// It is responsible for calling the methods provided in the
  /// [LoadingStateHandlerWidget] according to the state of the widget.
  ///
  /// The methods are called with the default methods if they are not provided.
  /// If the default methods are not provided, the methods are not called.
  ///
  /// The methods are called with the [BuildContext] and the corresponding
  /// message as arguments.
  ///
  /// The methods are called in the following order:
  ///
  /// 1. [onLoading] if [loading] is true.
  /// 2. [onError] if [error] is true.
  /// 3. [onEmpty] if [empty] is true.
  /// 4. [onData] if [loading], [error], and [empty] are all false.
  ///
  /// If the methods are not provided, the default methods are called.
  /// If the default methods are not provided, the methods are not called.
  void _applyMethods() {
    if (widget.loading) {
      if (widget.onLoading != null) {
        widget.onLoading?.call(
            LoadingStateHandlerWidget._defaultOnLoading, widget.loadingMessage);
      } else {
        LoadingStateHandlerWidget._defaultOnLoading
            ?.call(context, widget.loadingMessage);
      }
    } else if (widget.error) {
      if (widget.onError != null) {
        widget.onError?.call(
            LoadingStateHandlerWidget._defaultOnError, widget.errorMessage);
      } else {
        LoadingStateHandlerWidget._defaultOnError
            ?.call(context, widget.errorMessage);
      }
    } else if (widget.empty) {
      if (widget.onEmpty != null) {
        widget.onEmpty?.call(
            LoadingStateHandlerWidget._defaultOnEmpty, widget.emptyMessage);
      } else {
        LoadingStateHandlerWidget._defaultOnEmpty
            ?.call(context, widget.emptyMessage);
      }
    } else {
      if (widget.onData != null) {
        widget.onData?.call(
            LoadingStateHandlerWidget._defaultOnData, widget.dataMessage);
      } else {
        if (widget.onData != null) {
          widget.onData?.call(
              LoadingStateHandlerWidget._defaultOnData, widget.dataMessage);
        } else {
          LoadingStateHandlerWidget._defaultOnData
              ?.call(context, widget.dataMessage);
        }
      }
    }
  }
}
