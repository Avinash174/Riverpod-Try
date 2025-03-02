import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});
final switchProvider = StateProvider<bool>((ref) {
  return false;
});

class CounterAppWithStateful extends ConsumerStatefulWidget {
  const CounterAppWithStateful({super.key});

  @override
  ConsumerState<CounterAppWithStateful> createState() =>
      _CounterAppWithStatefulState();
}

class _CounterAppWithStatefulState
    extends ConsumerState<CounterAppWithStateful> {
  @override
  void initState() {
    super.initState();
    ref.read(switchProvider.notifier).state = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, child) {
            final counter1 = ref.watch(counter);
            log('build2');
            return Center(
              child: Text(
                counter1.toString(),
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 28,
                ),
              ),
            );
          }),
          Consumer(builder: (context, ref, child) {
            final counter2 = ref.watch(switchProvider);
            log('build3');
            return Switch(
                value: counter2,
                onChanged: (value) {
                  ref.read(switchProvider.notifier).state = value;
                });
          }),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state++;
                },
                child: const Text(
                  '+',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state--;
                },
                child: const Text(
                  '-',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class CounterAppWithStateless extends ConsumerWidget {
//   const CounterAppWithStateless({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     log('build');
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Consumer(builder: (context, ref, child) {
//             final counter1 = ref.watch(counter);
//             log('build2');
//             return Center(
//               child: Text(
//                 counter1.toString(),
//                 style: TextStyle(
//                   color: Colors.orange,
//                   fontSize: 28,
//                 ),
//               ),
//             );
//           }),
//           Consumer(builder: (context, ref, child) {
//             final counter2 = ref.watch(switchProvider);
//             log('build3');
//             return Switch(
//                 value: counter2,
//                 onChanged: (value) {
//                   ref.read(switchProvider.notifier).state = value;
//                 });
//           }),
//           const SizedBox(
//             height: 5,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   ref.read(counter.notifier).state++;
//                 },
//                 child: const Text(
//                   '+',
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   ref.read(counter.notifier).state--;
//                 },
//                 child: const Text(
//                   '-',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

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
