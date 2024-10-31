import 'package:flutter/material.dart';

class LoadingStateHandlerWidget extends StatefulWidget {
  static Widget Function(BuildContext, String?)? _defaultLoadingBuilder;
  static Widget Function(BuildContext, String?)? _defaultErrorBuilder;
  static Widget Function(BuildContext, String?)? _defaultEmptyBuilder;

  static Function(BuildContext, String?)? _defaultOnLoading;
  static Function(BuildContext, String?)? _defaultOnError;
  static Function(BuildContext, String?)? _defaultOnEmpty;
  static Function(BuildContext, String?)? _defaultOnData;

  final bool loading;
  final bool error;
  final bool empty;
  final String? errorMessage;
  final String? emptyMessage;
  final String? loadingMessage;
  final String? dataMessage;

  final Widget? loadingWidget;

  final Widget? errorWidget;

  final Widget? emptyWidget;

  final Widget child;

  final Function(
    Function(BuildContext, String?)?,
    String?,
  )? onError;

  final Function(
    Function(BuildContext, String?)?,
    String?,
  )? onEmpty;

  final Function(
    Function(BuildContext, String?)?,
    String?,
  )? onLoading;

  final Function(
    Function(BuildContext, String?)?,
    String?,
  )? onData;

  const LoadingStateHandlerWidget({
    super.key,
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

  @override
  State<LoadingStateHandlerWidget> createState() =>
      _LoadingStateHandlerWidgetState();

  static void setDefaultWidgets({
    Widget Function(BuildContext, String?)? defaultLoadingBuilder,
    Widget Function(BuildContext, String?)? defaultErrorBuilder,
    Widget Function(BuildContext, String?)? defaultEmptyBuilder,
    Function(BuildContext, String?)? defaultOnError,
    Function(BuildContext, String?)? defaultOnEmpty,
    Function(BuildContext, String?)? defaultOnLoading,
    Function(BuildContext, String?)? defaultOnData,
  }) {
    _defaultLoadingBuilder = defaultLoadingBuilder;
    _defaultErrorBuilder = defaultErrorBuilder;
    _defaultEmptyBuilder = defaultEmptyBuilder;

    _defaultOnError = defaultOnError;
    _defaultOnEmpty = defaultOnEmpty;
    _defaultOnLoading = defaultOnLoading;
    _defaultOnData = defaultOnData;
  }
}

class _LoadingStateHandlerWidgetState extends State<LoadingStateHandlerWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      return widget.loadingWidget ??
          LoadingStateHandlerWidget._defaultLoadingBuilder!(
              context, widget.loadingMessage);
    } else if (widget.error) {
      return widget.errorWidget ??
          LoadingStateHandlerWidget._defaultErrorBuilder!(
              context, widget.errorMessage);
    } else if (widget.empty) {
      return widget.emptyWidget ??
          LoadingStateHandlerWidget._defaultEmptyBuilder!(
              context, widget.emptyMessage);
    } else {
      return widget.child;
    }
  }

  @override
  void didUpdateWidget(covariant LoadingStateHandlerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _applyMethods(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _applyMethods(),
    );
  }

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
