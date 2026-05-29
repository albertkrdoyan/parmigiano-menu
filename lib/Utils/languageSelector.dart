import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parmigiano_menu/Providers/menu_data_provider.dart';

import 'constants.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 100,
      child: DropdownFlutter<String>(
        items: languages,
        initialItem: languages[0],
        onChanged: (value) {
          ref.read(menuProvider.notifier).changeLanguage(value!);
          ref.read(subMenuProvider.notifier).changeLanguage(value);
        },
      ),
    );
  }
}
