import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_try/slider_provider.dart';

class HomeScreenWithStateless extends ConsumerWidget {
  const HomeScreenWithStateless({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Slider build from here');

    final appState = ref.watch(slideProviders);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget with Riverpod'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon Change on Tap
          InkWell(
            onTap: () {
              log('Icon state changed');
              ref.read(slideProviders.notifier).state =
                  appState.copyWith(showPassword: !appState.showPassword);
            },
            child: Container(
              width: 200,
              height: 200,
              child: appState.showPassword
                  ? const Icon(Icons.remove_red_eye)
                  : const Icon(Icons.home),
            ),
          ),

          const SizedBox(height: 20),

          // Box Color Changes with Slider
          Container(
            width: 200,
            height: 200,
            color: Colors.yellow.withOpacity(appState.slider),
          ),

          const SizedBox(height: 20),

          // Slider to Control Opacity
          Slider(
            value: appState.slider,
            min: 0.0,
            max: 1.0,
            onChanged: (value) {
              log('Slider changed: $value');
              ref.read(slideProviders.notifier).state =
                  appState.copyWith(slider: value);
            },
          ),
        ],
      ),
    );
  }
}
