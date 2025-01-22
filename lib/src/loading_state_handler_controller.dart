import 'loading_state_handler_controller_imports.dart';

/// A controller for [LoadingStateHandlerWidget].
///
/// This controller is used to control the state of the
/// [LoadingStateHandlerWidget]. It is not necessary to use a [StatefulWidget] or
/// trigger a rebuild when changing the state of the widget. The controller
/// provides a simple way to set the state of the widget.
///
/// The controller can be used to set the state of the widget to
/// [CurrentStateEnum.normal], [CurrentStateEnum.loading],
/// [CurrentStateEnum.data], [CurrentStateEnum.empty], or
/// [CurrentStateEnum.error].
///
/// The [LoadingStateHandlerWidget] takes a [controller] property which is an
/// instance of [LoadingStateHandlerController]. The [controller] is used to
/// control the state of the widget.
///
/// When the state of the widget is changed, the [LoadingStateHandlerWidget] will
/// rebuild with the new state.
class LoadingStateHandlerController extends ValueNotifier<CurrentStateEnum> {
  /// Creates a new [LoadingStateHandlerController].
  ///
  /// The [initialState] parameter is used to set the initial state of the
  /// widget. If [initialState] is not provided, the initial state will be
  /// [CurrentStateEnum.normal].
  LoadingStateHandlerController({CurrentStateEnum? initialState})
      : super(initialState ?? CurrentStateEnum.normal);

  /// Sets the state of the widget to [CurrentStateEnum.data].
  void setData() {
    value = CurrentStateEnum.data;
  }

  /// Sets the state of the widget to [CurrentStateEnum.empty].
  void setEmpty() {
    value = CurrentStateEnum.empty;
  }

  /// Sets the state of the widget to [CurrentStateEnum.error].
  void setError() {
    value = CurrentStateEnum.error;
  }

  /// Sets the state of the widget to [CurrentStateEnum.loading].
  void setLoading() {
    value = CurrentStateEnum.loading;
  }

  /// Sets the state of the widget to [CurrentStateEnum.normal].
  void setNormal() {
    value = CurrentStateEnum.normal;
  }
}
