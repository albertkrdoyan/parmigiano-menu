import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parmigiano_menu/Utils/constants.dart';

class SubMenuProvider extends Notifier<List<String>> {
  @override
  List<String> build() {
    return subMenuAm;
  }

  void changeLanguage(String lang) {
    if (lang == 'AM') {
      state = subMenuAm;
    }
    if (lang == 'EN') {
      state = subMenuEn;
    }
    if (lang == 'RU') {
      state = subMenuRu;
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
    if (lang == 'AM') {
      state = menuAm;
    }
    if (lang == 'EN') {
      state = menuEn;
    }
    if (lang == 'RU') {
      state = menuRu;
    }
  }
}

final menuProvider =
    NotifierProvider<MenuProvider, Map<String, List<List<String>>>>(() {
      return MenuProvider();
    });
