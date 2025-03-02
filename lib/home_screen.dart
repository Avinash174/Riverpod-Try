import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_try/slider_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);

    return Scaffold(
      appBar: AppBar(title: Text('State Management')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, child) {
            // ✅ Corrected: Select only `showPassword` from the state
            final showPassword = ref.watch(
              appStateProvider.select((state) => state.showPassword),
            );

            return InkWell(
              onTap: () {
                final stateProvider = ref.read(appStateProvider.notifier);
                // ✅ Corrected: Toggle `showPassword` instead of assigning the same value
                stateProvider.state = stateProvider.state.copyWith(
                  showPassword: !showPassword,
                );
              },
              child: Container(
                height: 200,
                width: 200,
                child: showPassword
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.home),
              ),
            );
          }),
          Consumer(builder: (context, ref, child) {
            // ✅ Watch only `slider` instead of the entire state
            final slider =
                ref.watch(appStateProvider.select((state) => state.slider));

            return Container(
              height: 200,
              width: 200,
              color: Colors.red.withOpacity(slider),
            );
          }),
          Consumer(builder: ((context, ref, child) {
            // ✅ Use the correct slider value
            final slider =
                ref.watch(appStateProvider.select((state) => state.slider));

            return Slider(
              value: slider,
              onChanged: (value) {
                ref.read(appStateProvider.notifier).state =
                    appState.copyWith(slider: value);
              },
            );
          })),
          Consumer(builder: (context, ref, child) {
            // ✅ Watch only `showPassword`
            final showPassword = ref
                .watch(appStateProvider.select((state) => state.showPassword));

            return Switch(
              value: showPassword,
              onChanged: (value) {
                ref.read(appStateProvider.notifier).state =
                    appState.copyWith(showPassword: value);
              },
            );
          }),
        ],
      ),
    );
  }
}
