// state provider  - we can change here
// stateless with widget switch button and counter app

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref) {
  return "Avinash";
});

final conter = StateProvider<int>((ref) {
  return 0;
});

final checkProvider = StateProvider((ref) {
  return false;
});

class CounterWithStateless extends ConsumerWidget {
  const CounterWithStateless({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build1] from top');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter With Stateless Widgets',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final counterIncr = ref.watch(conter);
            print('build only this');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    counterIncr.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(conter.notifier).state++;
                      },
                      child: const Text('Increment Value +1'))
                ],
              ),
            );
          }),
          Consumer(builder: (context, ref, child) {
            final swichbtn = ref.watch(checkProvider);
            print('build only switchbtn');

            return Switch(
              value: swichbtn,
              onChanged: (value) {
                ref.read(checkProvider.notifier).state = value;
              },
            );
          }),
        ],
      ),
    );
  }
}

// class StateProviderExample extends ConsumerStatefulWidget {
//   const StateProviderExample({super.key});

//   @override
//   ConsumerState<StateProviderExample> createState() =>
//       _StateProviderExampleState();
// }

// class _StateProviderExampleState extends ConsumerState<StateProviderExample> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stateful Widget'),
//       ),
//       body: Center(
//         child: Column(
//           children: [],
//         ),
//       ),
//     );
//   }
// }
