import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// to read const value that stae never change
final hello = Provider<String>((ref) {
  return 'hello all';
});
final age = Provider<int>((ref) {
  return 11;
});

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
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
