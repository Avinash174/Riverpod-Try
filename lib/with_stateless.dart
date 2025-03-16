import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_try/slider_provider.dart';

class HomeScreenWithStateless extends ConsumerWidget {
  const HomeScreenWithStateless({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slider = ref.watch(slideProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget with Riverpod'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.yellow.withOpacity(0.5),
          ),
          Slider(
            value: slider,
            onChanged: (value) {
              ref.read(slideProvider.notifier).state = value;
            },
          )
        ],
      ),
    );
  }
}
