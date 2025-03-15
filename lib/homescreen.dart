import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref) {
  return "Avinash";
});

final age = Provider<int>((ref) {
  return 1;
});

// for statful widget

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final age1 = ref.watch(age);
    final myName = ref.watch(hello);
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget'),
      ),
      body: Center(
        child: Text(myName + " " + age1.toString()),
      ),
    );
  }
}

// for stateless widget
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final helloALl = ref.watch(hello);
//     final ageMy = ref.watch(age);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('stateless widget'),
//       ),
//       body: Center(
//         child: Text(helloALl + " " + ageMy.toString()),
//       ),
//     );
//   }
// }
