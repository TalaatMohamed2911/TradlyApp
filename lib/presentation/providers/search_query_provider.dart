import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class SearchQueryNotifier extends Notifier<String> {
  Timer? _debounce;

  @override
  String build() {
    ref.onDispose(() {
      _debounce?.cancel();
    });
    return '';
  }

  void updateQuery(String query) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 1500), () {
      state = query;
    });
  }
}

// final searchQueryProvider = StateProvider.autoDispose<String>((ref) => '');
final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(
  SearchQueryNotifier.new,
);
