import 'package:flutter/material.dart' show Widget, BuildContext, VoidCallback;

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
