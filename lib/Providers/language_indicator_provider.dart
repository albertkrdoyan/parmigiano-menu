import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageIndicatorProvider extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void changeLanguageIndicator(int i) {
    state = i;
  }
}

final languageIndicatorProvider =
    NotifierProvider<LanguageIndicatorProvider, int>(() {
      return LanguageIndicatorProvider();
    });
