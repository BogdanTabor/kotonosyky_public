import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/cat_page_bloc.dart';
import '../../utilities/language_provider.dart';

class LanguageSwitchButton extends StatelessWidget {
  const LanguageSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    EdgeInsets edgeInsets = const EdgeInsets.only(left: 8.0);

    return DropdownButton<Locale>(
      onChanged: (newLocale) {
        if (newLocale != null) {
          languageProvider.updateLocale(newLocale);
          context
              .read<CatsBloc>()
              .add(LanguageChangeEvent(newLocale.toString().substring(0, 2)));
        }
      },
      icon: const Padding(
        padding: EdgeInsets.only(left: 4.0),
        child: Icon(Icons.expand_more_rounded, size: 18),
      ),
      value: languageProvider.currentLocale,
      focusColor: Colors.transparent,
      underline: const SizedBox(),
      items: [
        DropdownMenuItem(
          value: const Locale('en', 'US'),
          child: Padding(
            padding: edgeInsets,
            child: Image.asset('lib/assets/great_britain.png', height: 14),
          ),
        ),
        DropdownMenuItem(
          value: const Locale('uk', 'UA'),
          child: Padding(
            padding: edgeInsets,
            child: Image.asset('lib/assets/ukraine.png', height: 14),
          ),
        ),
        DropdownMenuItem(
          value: const Locale('de', 'DE'),
          child: Padding(
            padding: edgeInsets,
            child: Image.asset('lib/assets/deutschland.png', height: 14),
          ),
        ),
      ],
    );
  }
}
