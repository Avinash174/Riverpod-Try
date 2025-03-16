// state provider  - we can change here
// stateless with widget

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref) {
  return "Avinash";
});

final conter = StateProvider<int>((ref) {
  return 0;
});

class CounterWithStateless extends ConsumerWidget {
  const CounterWithStateless({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widgets'),
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
