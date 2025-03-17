import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier used to handle complex state

final searchNotifier = StateNotifierProvider<SearchNotifier, String>(
  (ref) =>
      SearchNotifier(), // Correctly returning an instance of SearchNotifier
);

class SearchNotifier extends StateNotifier<String> {
  SearchNotifier() : super('');

  void search(String query) {
    state = query;
  }
}
