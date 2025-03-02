import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});

class CounterAppWithStateless extends ConsumerWidget {
  const CounterAppWithStateless({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter1 = ref.watch(counter);
    return Scaffold(
      body: Center(
        child: Text(
          counter1.toString(),
        ),
      ),
    );
  }
}

// class CounterApp extends ConsumerStatefulWidget {
//   const CounterApp({super.key});

//   @override
//   ConsumerState<CounterApp> createState() => _CounterAppState();
// }

// class _CounterAppState extends ConsumerState<CounterApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('data'),
//       ),
//     );
//   }
// }
