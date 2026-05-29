import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parmigiano_menu/Utils/constants.dart';

class SubMenuProvider extends Notifier<List<String>> {
  @override
  List<String> build() {
    return subMenuAm;
  }

  void changeLanguage(String lang) {
    if (lang == languages[0]) {
      state = subMenuAm;
    } else if (lang == languages[1]) {
      state = subMenuRu;
    } else if (lang == languages[2]) {
      state = subMenuEn;
    }
  }
}
final subMenuProvider = NotifierProvider<SubMenuProvider, List<String>>(() {
  return SubMenuProvider();
});

class MenuProvider extends Notifier<Map<String, List<List<String>>>> {
  @override
  Map<String, List<List<String>>> build() {
    return menuAm;
  }

  void changeLanguage(String lang) {
    if (lang == languages[0]) {
      state = menuAm;
    } else if (lang == languages[1]) {
      state = menuRu;
    } else if (lang == languages[2]) {
      state = menuEn;
    }
  }
}
final menuProvider =
    NotifierProvider<MenuProvider, Map<String, List<List<String>>>>(() {
      return MenuProvider();
    });

