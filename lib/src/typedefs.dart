import 'package:flutter/material.dart' show Widget, BuildContext, VoidCallback;

import 'current_state_enum.dart';

/// A builder for the child widget.
///
/// The [context] parameter provides the location in the widget tree where this
/// widget is being built.
///
/// The [currentState] parameter is the current state of the widget.
///
/// This builder is useful for conditionally rendering different child widgets
/// based on the current state of the widget.
typedef ChildBuilder = Widget Function(
  BuildContext context,
  CurrentStateEnum currentState,
  Widget child,
);

typedef DefaultEmptyBuilder = Widget Function(
  BuildContext context,
  String? message,
)?;

typedef DefaultErrorBuilder = Widget Function(
  BuildContext context,
  String? errorMessage,
  Widget retryButton,
  Duration retryCooldown,
  VoidCallback? onRetry,
)?;

typedef DefaultLoadingBuilder = Widget Function(
  BuildContext context,
  String? message,
)?;

typedef DefaultOnData = void Function(
  BuildContext context,
  String? message,
)?;

typedef DefaultOnEmpty = void Function(
  BuildContext context,
  String? message,
)?;

typedef DefaultOnError = void Function(
  BuildContext context,
  String? errorMessage,
  VoidCallback? onRetry,
)?;

typedef DefaultOnLoading = void Function(
  BuildContext context,
  String? message,
)?;

typedef OnData = Function(
  DefaultOnData defaultOnData,
  BuildContext context,
  String? message,
)?;

typedef OnEmpty = Function(
  DefaultOnEmpty defaultOnEmpty,
  BuildContext context,
  String? message,
)?;

typedef OnError = Function(
  DefaultOnError defaultOnError,
  BuildContext context,
  String? errorMessage,
  VoidCallback? onRetry,
)?;

typedef OnLoading = Function(
  DefaultOnLoading defaultOnLoading,
  BuildContext context,
  String? message,
)?;

/// A callback that is called when the state of the widget changes.
///
/// The [oldState] parameter is the previous state of the widget.
///
/// The [newState] parameter is the new state of the widget.
///
/// This callback is useful for tracking state changes and performing actions
/// when the state changes, such as analytics tracking or logging.
typedef OnStateChange = void Function(
  CurrentStateEnum oldState,
  CurrentStateEnum newState,
);
