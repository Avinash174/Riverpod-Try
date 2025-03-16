// handling multiple state

// don't use with stateProvider Multistate provider
//it's only for jugad some time

import 'package:flutter_riverpod/flutter_riverpod.dart';

final slideProvider = StateProvider((ref) => 0.0);

final slideProviders = StateProvider<AppState>(
  (ref) => AppState(
    slider: .5,
    showPassword: false,
  ),
);

class AppState {
  final double slider;
  final bool showPassword;
  AppState({required this.slider, required this.showPassword});

  AppState copyWith({
    double? slider,
    bool? showPassword,
  }) {
    return AppState(
      slider: slider ?? this.slider,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
