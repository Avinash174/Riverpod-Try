import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_try/slider_provider.dart';

// to read const value that stae never change
final hello = Provider<String>((ref) {
  return 'hello all';
});
final age = Provider<int>((ref) {
  return 11;
});

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slider = ref.watch(slideProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red.withOpacity(slider),
          ),
          Slider(
              value: slider,
              onChanged: (value) {
                ref.read(slideProvider.notifier).state == value;
              })
        ],
      ),
    );
  }
}


// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final subscribe = ref.watch(hello);
//     final age1 = ref.watch(age);
//     return Scaffold(
//       body: Center(
//         child: Text(
//           subscribe + " " + " " + age1.toString(),
//         ),
//       ),
//     );
//   }
// }
