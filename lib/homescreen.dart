import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_try/counter_stateless.dart';
import 'package:riverpod_try/search_provider.dart';
import 'package:riverpod_try/with_stateless.dart';

// we can't change his state

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
    final search = ref.watch(searchNotifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myName + " " + age1.toString(),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterWithStateless(),
                      ),
                    );
                  },
                  child: const Text(
                    'Stateless With Counter App',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreenWithStateless(),
                      ),
                    );
                  },
                  child: const Text(
                    'Stateless With Name & Age Access',
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    ref.read(searchNotifier.notifier).search(value);
                  },
                ),
                Consumer(builder: (context, ref, child) {
                  final search = ref.watch(searchNotifier);
                  return Text(search.search);
                }),
                Consumer(builder: (context, ref, child) {
                  final change = ref.watch(searchNotifier);
                  return Switch(
                      value: change.isChange,
                      onChanged: (value) {
                        ref.read(searchNotifier.notifier).onChange(value);
                      });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
