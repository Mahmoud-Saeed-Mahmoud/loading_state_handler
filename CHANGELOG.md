## 0.0.1

* Initial release.

## 0.0.2

* changed the description in `pubspec.yaml`.

## 0.0.3

- **Added**: String error message support in `StateHandlerWidget`.
- **Updated**: Documentation to clarify widget behavior for loading, error, and empty states.
- **Refined**: Default builder functions for consistent styling across app states.


## 0.0.4

- **Added**: Example usage for better demonstration of widget functionality.


## 0.0.5

- **Updated**: Documentation to clarify widget behavior for loading, error, and empty states.

## 0.0.6

- **Updated**: Description in `pubspec.yaml`.


## 1.0.0

- **Added** new feature to `StateHandlerWidget`.

## 1.0.1

- **Refined**: Documentation to clarify widget behavior for loading, error, and empty states.

## 1.0.2

- **Fixed**: Issue with `onLoading` callback in `StateHandlerWidget`.

## 1.0.3

- **Updated**: Default builder functions for consistent styling across app states.

## 1.0.4

- **Updated**: README to use the latest version of `loading_state_handler`.

## 1.0.5

- **Added**: bool `disableWidgetChanges` in `StateHandlerWidget`.

## 1.0.6

- **Added**: `disableEmptyWidgetChanges` and `disableErrorWidgetChanges` callback in `StateHandlerWidget`.

## 1.0.7

- **Updated**: README to use the latest version of `loading_state_handler`.

## 1.0.8

- **Fixed**: `disableWidgetChanges` callback in `StateHandlerWidget`.

## 1.0.9

- **Added**: `onData` callback in `StateHandlerWidget`.

## 1.1.0

- **Updated**: README to use the latest version of `loading_state_handler`.

## 1.1.1

- **Fixed**: Issue with `onData` callback in `StateHandlerWidget`.

## 1.1.2

- **Added**: `BuildContext` parameter in `StateHandlerWidget`.

## 1.2.0

### New Features
- **Added**: Retry mechanism with configurable cooldown
- **Added**: Global defaults configuration through `setDefaults` method
- **Added**: Per-instance retry controls with visual countdown
- **Added**: Customizable retry callback functionality

### Improvements
- **Enhanced**: Constructor is now `const` for better performance
- **Improved**: State management with cleaner implementation
- **Updated**: Documentation with comprehensive examples
- **Refined**: Default widget behavior and configuration

### Breaking Changes
- Renamed `setDefaultWidgets` to `setDefaults` for better clarity
- Moved retry configuration to `setDefaults` method

## 1.3.0

### New Features
- **Added**: `retryBtnText` and `retryMessage` parameters in `StateHandlerWidget`.
- **Added**: `retryBtnTextStyle` and `retryMessageStyle` parameters in `StateHandlerWidget`.
- **Added**: `retryButtonStyle` parameter in `StateHandlerWidget`.
- **Added**: `CurrentStateEnum` parameter in `StateHandlerWidget`.

## 1.3.1

- **Updated**: `onError` callback in `LoadingStateHandlerWidget` to include the `onRetry` callback.

## 1.3.2

- **Fixed**: Issue with assertion in `StateHandlerWidget`.