import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/language_provider.dart';
import 'about_page.dart';

class MarkdownLoader {
  static Future<List<ExpansionPanelItem>> loadMarkdownContent(
      BuildContext context) async {
    final LanguageProvider languageProvider = context.read<LanguageProvider>();
    final String selectedLanguageCode =
        languageProvider.currentLocale.languageCode;
    final String markdownFilePath = 'lib/assets/about_$selectedLanguageCode.md';

    final String markdownData = await rootBundle.loadString(markdownFilePath);
    final List<String> sections = markdownData.split('### ');

    final List<ExpansionPanelItem> items = [];

    // Process the first section
    final List<String> firstSectionParts = sections.first.split('\n');
    if (firstSectionParts.isNotEmpty) {
      final String firstSectionHeader = firstSectionParts.first.trim();
      final String firstSectionBody = firstSectionParts.sublist(1).join('\n');
      items.add(
        ExpansionPanelItem(
          headerValue: firstSectionHeader,
          body: firstSectionBody,
        ),
      );
    }

    // Process the remaining sections
    for (final section in sections.skip(1)) {
      final List<String> parts = section.split('\n');
      if (parts.isNotEmpty) {
        final String header = parts.first.trim();
        final String body = parts.sublist(1).join('\n');
        items.add(
          ExpansionPanelItem(
            headerValue: header,
            body: body,
          ),
        );
      }
    }

    return items;
  }
}
