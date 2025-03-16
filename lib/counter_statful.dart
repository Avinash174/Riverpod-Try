import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final count = StateProvider((ref) => 0);
final checkState = StateProvider((ref) => false);

class CounterSwitchBtn extends ConsumerStatefulWidget {
  const CounterSwitchBtn({super.key});

  @override
  ConsumerState<CounterSwitchBtn> createState() => _CounterSwitchBtnState();
}

class _CounterSwitchBtnState extends ConsumerState<CounterSwitchBtn> {
  @override
  Widget build(BuildContext context) {
    print('Whole Scaffold Rebuilt');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stateful Widget Using CounterSwitchBtn',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, child) {
            final countIcr = ref.watch(count); // Now inside Consumer
            return Column(
              children: [
                Center(
                  child: Text(
                    countIcr.toString(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Build Incr');
                    ref.read(count.notifier).state++;
                  },
                  child: const Text('Icr +'),
                ),
              ],
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Consumer(builder: (context, ref, child) {
            print('Build Switch');
            final changebtn1 = ref.watch(checkState);
            return Switch(
                value: changebtn1,
                onChanged: (value) {
                  ref.read(checkState.notifier).state = value;
                });
          }),
        ],
      ),
    );
  }
}
