import 'dart:async';

import 'package:flutter/material.dart';

import 'current_state_enum.dart';
import 'typedefs.dart';

/// A widget that handles loading, error, and empty states.
///
class LoadingStateHandlerWidget extends StatefulWidget {
  /// Default empty widget builder.
  ///
  /// This callback will be called when [empty] is true or [currentState] is [CurrentStateEnum.empty], and the default
  /// widget is displayed.
  ///
  /// The default implementation is to display a [Text] widget in the center of
  /// the screen with the empty message.
  ///
  /// If not null, the default empty widget will be displayed when [empty] is
  /// true or [currentState] is [CurrentStateEnum.empty].
  ///
  /// The default value is null, which means the default empty widget will not
  /// be displayed.
  static DefaultEmptyBuilder _defaultEmptyBuilder;

  /// Default error widget builder.
  ///
  /// This callback will be called when [error] is true or [currentState] is [CurrentStateEnum.error], and the default
  /// widget is displayed.
  ///
  /// The default implementation is to display a [Text] widget in the center of
  /// the screen with the error message.
  ///
  /// If not null, the default error widget will be displayed when [error] is
  /// true or [currentState] is [CurrentStateEnum.error].
  ///
  /// The default value is null, which means the default error widget will not
  /// be displayed.
  static DefaultErrorBuilder _defaultErrorBuilder;

  /// The title of the error dialog.
  ///
  /// The default value is 'Error'.
  static String _defaultErrorTitle = 'Error';

  /// Default loading widget builder.
  ///
  /// This callback will be called when [loading] is true or [currentState] is [CurrentStateEnum.loading], and the default
  /// widget is displayed.
  ///
  /// The default implementation is to display a [CircularProgressIndicator] in
  /// the center of the screen.
  ///
  /// If not null, the default loading widget will be displayed when [loading] is
  /// true or [currentState] is [CurrentStateEnum.loading].
  ///
  /// The default value is null, which means the default loading widget will not
  /// be displayed.
  static DefaultLoadingBuilder _defaultLoadingBuilder;

  /// Default on data callback.
  ///
  /// This callback will be called when [loading] is false, [error] is false,
  /// and [empty] is false or [currentState] is [CurrentStateEnum.data].
  ///
  /// If not null, the default on data callback will be called when [loading] is
  /// false, [error] is false, and [empty] is false or [currentState] is [CurrentStateEnum.data].
  ///
  /// The default value is null, which means the default on data callback will
  /// not be called.
  static DefaultOnData _defaultOnData;

  /// Default on empty callback.
  ///
  /// This callback will be called when [empty] is true or [currentState] is [CurrentStateEnum.empty].
  ///
  /// If not null, the default on empty callback will be called when [empty] is
  /// true or [currentState] is [CurrentStateEnum.empty].
  ///
  /// The default value is null, which means the default on empty callback will
  /// not be called.
  static DefaultOnEmpty _defaultOnEmpty;

  /// Default on error callback.
  ///
  /// This callback will be called when [error] is true or [currentState] is [CurrentStateEnum.error].
  ///
  /// If not null, the default on error callback will be called when [error] is
  /// true or [currentState] is [CurrentStateEnum.error].
  ///
  /// The default value is null, which means the default on error callback will
  /// not be called.
  static DefaultOnError _defaultOnError;

  /// Default on loading callback.
  ///
  /// This callback will be called when [loading] is true or [currentState] is [CurrentStateEnum.loading].
  ///
  /// If not null, the default on loading callback will be called when [loading]
  /// is true or [currentState] is [CurrentStateEnum.loading].
  ///
  /// The default value is null, which means the default on loading callback will
  /// not be called.
  static DefaultOnLoading _defaultOnLoading;

  /// Default retry button text.
  ///
  /// This is the default button text that users will see when they retry after an error.
  static String _defaultRetryBtnText = 'Retry';

  /// Default retry button text style.
  ///
  /// This is the default button text style that users will see when they retry after an error.
  static TextStyle? _defaultRetryBtnTextStyle;

  /// Default retry button style.
  ///
  /// This is the default button style that users will see when they retry after an error.
  static ButtonStyle? _defaultRetryButtonStyle;

  /// Default retry cooldown duration in seconds.
  ///
  /// This is the default duration that users must wait before retrying after an error.
  static Duration _defaultRetryCooldown = const Duration(seconds: 5);

  /// Default retry message.
  ///
  /// This is the default message that users will see when they retry after an error.
  static String? _defaultRetryMessage = 'Retry available in %_ seconds';

  /// Default retry message style.
  ///
  /// This is the default message style that users will see when they retry after an error.
  static TextStyle? _defaultRetryMessageStyle;

  /// To disable empty widget changes globally.
  ///
  /// If set to true, empty widget changes will be disabled globally.
  ///
  /// The default value is false, which means empty widget changes are enabled globally.
  static bool? _disableEmptyWidgetChanges;

  /// To disable error widget changes globally.
  ///
  /// If set to true, error widget changes will be disabled globally.
  ///
  /// The default value is false, which means error widget changes are enabled globally.
  static bool? _disableErrorWidgetChanges;

  /// To disable widget changes globally.
  ///
  /// If set to true, widget changes will be disabled globally.
  ///
  /// The default value is false, which means widget changes are enabled globally.
  static bool? _disableWidgetChanges;

  /// The widget to display when the state is normal.
  ///
  /// This widget will be displayed when [loading] is false, [error] is false,
  /// and [empty] is false or [currentState] is [CurrentStateEnum.normal].
  final Widget child;

  /// The current state of the widget.
  final CurrentStateEnum currentState;

  /// Whether the widget is in a data state.
  final bool data;

  /// The data message.
  final String? dataMessage;

  /// To disable empty widget changes.
  ///
  /// If set to true, empty widget changes will be disabled.
  ///
  /// The default value is false, which means empty widget changes are enabled.
  final bool disableEmptyWidgetChanges;

  /// To disable error widget changes.
  ///
  /// If set to true, error widget changes will be disabled.
  ///
  /// The default value is false, which means error widget changes are enabled.
  final bool disableErrorWidgetChanges;

  /// To disable widget changes.
  ///
  /// If set to true, widget changes will be disabled.
  ///
  /// The default value is false, which means widget changes are enabled.
  final bool disableWidgetChanges;

  /// Whether the widget is in an empty state.
  final bool empty;

  /// The empty message.
  final String? emptyMessage;

  /// The widget to display when the state is empty.
  ///
  /// If not null, the [emptyWidget] will be displayed when [empty] is true or [currentState] is [CurrentStateEnum.empty].
  ///
  /// The default value is null, which means the default empty widget will be
  /// used.
  final Widget? emptyWidget;

  /// Whether the retry mechanism is enabled.
  final bool enableRetry;

  /// Whether the widget is in an error state.
  final bool error;

  /// The error message.
  final String? errorMessage;

  /// The title of the error.
  ///
  /// The default value is null, which means the default error title will be used.
  final String? errorTitle;

  /// The widget to display when the state is error.
  ///
  /// If not null, the [errorWidget] will be displayed when [error] is true or [currentState] is [CurrentStateEnum.error].
  ///
  /// The default value is null, which means the default error widget will be
  /// used.
  final Widget? errorWidget;

  /// Whether the widget is in a loading state.
  final bool loading;

  /// The loading message.
  final String? loadingMessage;

  /// The widget to display when the state is loading.
  ///
  /// If not null, the [loadingWidget] will be displayed when [loading] is true or [currentState] is [CurrentStateEnum.loading].
  ///
  /// The default value is null, which means the default loading widget will be
  /// used.
  final Widget? loadingWidget;

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
  final OnData onData;

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
  final OnEmpty onEmpty;

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
  final OnError onError;

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
  final OnLoading onLoading;

  /// The callback to be executed when retry is attempted.
  final VoidCallback? onRetry;

  /// The retry button text.
  ///
  /// The default value is null, which means the default retry button text will be used.
  final String? retryBtnText;

  /// The retry button text style.
  final TextStyle? retryBtnTextStyle;

  /// The retry button style.
  final ButtonStyle? retryButtonStyle;

  /// The duration to wait before allowing another retry attempt.
  final Duration? retryCooldown;

  /// The retry message.
  ///
  /// The default value is null, which means the default retry message will be used.
  /// The message should be in format of 'message to show %_ seconds'.
  ///
  /// The [%_] will be replaced with the remaining seconds.
  final String? retryMessage;

  /// The retry message style.
  final TextStyle? retryMessageStyle;

  const LoadingStateHandlerWidget({
    super.key,
    this.disableWidgetChanges = false,
    this.disableErrorWidgetChanges = false,
    this.disableEmptyWidgetChanges = false,
    this.currentState = CurrentStateEnum.normal,
    @Deprecated('Use currentState instead') this.loading = false,
    @Deprecated('Use currentState instead') this.error = false,
    @Deprecated('Use currentState instead') this.empty = false,
    @Deprecated('Use currentState instead') this.data = false,
    this.loadingMessage,
    this.errorMessage,
    this.emptyMessage,
    this.dataMessage,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.onError,
    this.onEmpty,
    this.onLoading,
    this.onData,
    this.errorTitle,
    this.retryButtonStyle,
    this.retryBtnTextStyle,
    this.retryMessageStyle,
    required this.child,
    this.onRetry,
    this.retryCooldown,
    this.retryBtnText,
    this.retryMessage,
    this.enableRetry = false,
  }) : assert(
          enableRetry == (onRetry != null),
          'onRetry must be provided if enableRetry is true',
        );

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
  static void setDefaults({
    bool? disableWidgetChanges,
    bool? disableErrorWidgetChanges,
    bool? disableEmptyWidgetChanges,
    Duration? defaultRetryCooldown,
    String? defaultRetryBtnText,
    String? defaultRetryMessage,
    String? defaultErrorTitle,
    TextStyle? defaultRetryBtnTextStyle,
    TextStyle? defaultRetryMessageStyle,
    ButtonStyle? defaultRetryButtonStyle,
    DefaultLoadingBuilder defaultLoadingBuilder,
    DefaultErrorBuilder defaultErrorBuilder,
    DefaultEmptyBuilder defaultEmptyBuilder,
    DefaultOnError defaultOnError,
    DefaultOnEmpty defaultOnEmpty,
    DefaultOnLoading defaultOnLoading,
    DefaultOnData defaultOnData,
  }) {
    _defaultRetryCooldown = defaultRetryCooldown ?? _defaultRetryCooldown;

    _defaultRetryButtonStyle =
        defaultRetryButtonStyle ?? _defaultRetryButtonStyle;
    _defaultRetryBtnTextStyle =
        defaultRetryBtnTextStyle ?? _defaultRetryBtnTextStyle;
    _defaultRetryMessageStyle =
        defaultRetryMessageStyle ?? _defaultRetryMessageStyle;
    _defaultRetryBtnText = defaultRetryBtnText ?? _defaultRetryBtnText;
    _defaultRetryMessage = defaultRetryMessage ?? _defaultRetryMessage;

    _defaultErrorTitle = defaultErrorTitle ?? _defaultErrorTitle;

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
  /// Remaining cooldown time in seconds.
  int _remainingCooldown = 0;

  /// The current retry cooldown timer.
  Timer? _retryCooldownTimer;

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
  /// If [loading] is true or [currentState] is [CurrentStateEnum.loading], the method returns the [loadingWidget] if it is not
  /// null, otherwise it returns the default loading widget which is a
  /// [Center] widget with a [CircularProgressIndicator].
  ///
  /// If [error] is true or [currentState] is [CurrentStateEnum.error], the method returns the [errorWidget] if it is not null,
  /// otherwise it returns the default error widget which is a [Center] widget
  /// with the text 'Error'.
  ///
  /// If [empty] is true or [currentState] is [CurrentStateEnum.empty], the method returns the [emptyWidget] if it is not null,
  /// otherwise it returns the default empty widget which is a [Center] widget
  /// with the text 'Empty'.
  ///
  /// If the state is normal, the method returns the [child] widget.
  Widget build(BuildContext context) {
    if (widget.disableWidgetChanges ||
        (LoadingStateHandlerWidget._disableWidgetChanges ?? false)) {
      return widget.child;
    } else {
      if (widget.loading || widget.currentState == CurrentStateEnum.loading) {
        return widget.loadingWidget ??
            LoadingStateHandlerWidget._defaultLoadingBuilder
                ?.call(context, widget.loadingMessage) ??
            const Center(
              child: CircularProgressIndicator(),
            );
      } else if (widget.error ||
          widget.currentState == CurrentStateEnum.error) {
        if (widget.disableErrorWidgetChanges ||
            (LoadingStateHandlerWidget._disableErrorWidgetChanges ?? false)) {
          return widget.child;
        }
        return widget.errorWidget ??
            LoadingStateHandlerWidget._defaultErrorBuilder?.call(
              context,
              widget.errorMessage,
              _buildRetryButton(),
              widget.retryCooldown ??
                  LoadingStateHandlerWidget._defaultRetryCooldown,
              widget.onRetry,
            ) ??
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.errorTitle ??
                        LoadingStateHandlerWidget._defaultErrorTitle,
                  ),
                  if (widget.errorMessage != null) Text(widget.errorMessage!),
                  const SizedBox(height: 16),
                  _buildRetryButton(),
                ],
              ),
            );
      } else if (widget.empty ||
          widget.currentState == CurrentStateEnum.empty) {
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
      } else if (widget.data || widget.currentState == CurrentStateEnum.data) {
        return widget.child;
      } else {
        // normal
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
  void dispose() {
    _retryCooldownTimer?.cancel();
    super.dispose();
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
  /// 1. [onLoading] if [loading] is true or [currentState] is [CurrentStateEnum.loading].
  /// 2. [onError] if [error] is true or [currentState] is [CurrentStateEnum.error].
  /// 3. [onEmpty] if [empty] is true or [currentState] is [CurrentStateEnum.empty].
  /// 4. [onData] if [loading], [error], and [empty] are all false or [currentState] is [CurrentStateEnum.data].
  ///
  /// If the methods are not provided, the default methods are called.
  /// If the default methods are not provided, the methods are not called.
  void _applyMethods() {
    if (widget.loading || widget.currentState == CurrentStateEnum.loading) {
      if (widget.onLoading != null) {
        widget.onLoading?.call(
          LoadingStateHandlerWidget._defaultOnLoading,
          context,
          widget.loadingMessage,
        );
      } else {
        LoadingStateHandlerWidget._defaultOnLoading
            ?.call(context, widget.loadingMessage);
      }
    } else if (widget.error || widget.currentState == CurrentStateEnum.error) {
      if (widget.onError != null) {
        widget.onError?.call(
          LoadingStateHandlerWidget._defaultOnError,
          context,
          widget.errorMessage,
          widget.onRetry,
        );
      } else {
        LoadingStateHandlerWidget._defaultOnError
            ?.call(context, widget.errorMessage, widget.onRetry);
      }
    } else if (widget.empty || widget.currentState == CurrentStateEnum.empty) {
      if (widget.onEmpty != null) {
        widget.onEmpty?.call(
          LoadingStateHandlerWidget._defaultOnEmpty,
          context,
          widget.emptyMessage,
        );
      } else {
        LoadingStateHandlerWidget._defaultOnEmpty
            ?.call(context, widget.emptyMessage);
      }
    } else if (widget.data || widget.currentState == CurrentStateEnum.data) {
      if (widget.onData != null) {
        widget.onData?.call(
          LoadingStateHandlerWidget._defaultOnData,
          context,
          widget.dataMessage,
        );
      } else {
        LoadingStateHandlerWidget._defaultOnData
            ?.call(context, widget.dataMessage);
      }
    }
  }

  /// Builds the retry button.
  ///
  /// This method returns a [Column] containing:
  ///
  /// 1. If [_remainingCooldown] is greater than 0, a [Text] with the
  ///    retry message. The retry message is optionally provided by the
  ///    user through the [retryMessage] constructor parameter.
  ///    If [retryMessage] is null, the default retry message is used.
  ///
  /// 2. An [ElevatedButton] that when pressed, calls the [onRetry] callback
  ///    and starts the retry cooldown timer.
  ///
  /// The [ElevatedButton] is only enabled when [_remainingCooldown]
  /// is 0, i.e., the cooldown has expired.
  ///
  /// The button is styled according to the [retryButtonStyle] constructor
  /// parameter. If [retryButtonStyle] is null, the default button style is
  /// used.
  ///
  /// The button's text is styled according to the [retryBtnTextStyle]
  /// constructor parameter. If [retryBtnTextStyle] is null, the default
  /// button text style is used.
  ///
  /// The button's text is the [retryBtnText] constructor parameter. If
  /// [retryBtnText] is null, the default button text is used.
  Widget _buildRetryButton() {
    if (!widget.enableRetry || widget.onRetry == null) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        if (_remainingCooldown > 0)
          Text(
            '${widget.retryMessage ?? LoadingStateHandlerWidget._defaultRetryMessage}'
                .replaceFirst(
              RegExp(r'%_'),
              _remainingCooldown.toString(),
            ),
            style: widget.retryMessageStyle ??
                LoadingStateHandlerWidget._defaultRetryMessageStyle,
          ),
        ElevatedButton(
          style: widget.retryButtonStyle ??
              LoadingStateHandlerWidget._defaultRetryButtonStyle,
          onPressed: _remainingCooldown > 0
              ? null
              : () {
                  widget.onRetry?.call();
                  _startRetryCooldown();
                },
          child: Text(
            widget.retryBtnText ??
                LoadingStateHandlerWidget._defaultRetryBtnText,
            style: widget.retryBtnTextStyle ??
                LoadingStateHandlerWidget._defaultRetryBtnTextStyle,
          ),
        ),
      ],
    );
  }

  /// Starts the retry cooldown timer.
  ///
  /// This method is called when the retry button is pressed. It sets the
  /// [_remainingCooldown] to the value of [retryCooldown] constructor
  /// parameter, or to the default value if [retryCooldown] is null.
  ///
  /// Then, it starts a timer that decrements [_remainingCooldown] every
  /// second. When [_remainingCooldown] reaches 0, the timer is cancelled.
  ///
  /// The timer is stored in [_retryCooldownTimer] to be cancelled if the
  /// retry button is pressed again before the cooldown has expired.
  void _startRetryCooldown() {
    if (!widget.enableRetry || widget.onRetry == null) return;

    /// if retryCooldown is null, use the default value
    _remainingCooldown = (widget.retryCooldown ??
            LoadingStateHandlerWidget._defaultRetryCooldown)
        .inSeconds;

    /// cancel the previous timer if it exists
    _retryCooldownTimer?.cancel();

    /// start the new timer
    _retryCooldownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (_remainingCooldown > 0) {
              _remainingCooldown--;
            } else {
              /// when the cooldown has expired, cancel the timer
              timer.cancel();
            }
          },
        );
      },
    );
  }
}
