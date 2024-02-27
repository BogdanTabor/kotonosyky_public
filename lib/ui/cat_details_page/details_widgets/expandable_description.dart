import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpandableDescription extends StatefulWidget {
  final Function toggle;
  final String? description;
  final String? features;
  final IconData sex;
  final bool expanded;
  final bool vaccinated;
  final bool sterilized;
  final bool chipped;

  const ExpandableDescription({
    super.key,
    this.description,
    this.features,
    required this.expanded,
    required this.vaccinated,
    required this.sterilized,
    required this.chipped,
    required this.sex,
    required this.toggle,
  });

  @override
  ExpandableDescriptionState createState() => ExpandableDescriptionState();
}

class ExpandableDescriptionState extends State<ExpandableDescription> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    String description = widget.description ?? widget.description!;
    String features = widget.features ?? widget.features!;
    String vaccinated = widget.vaccinated == true
        ? widget.sex == Icons.male
            ? AppLocalizations.of(context)!.vaccine_m
            : AppLocalizations.of(context)!.vaccine_f
        : '';
    String sterilized = widget.sterilized == true
        ? widget.sex == Icons.male
            ? AppLocalizations.of(context)!.sterile_m
            : AppLocalizations.of(context)!.sterile_f
        : '';
    String chipped = widget.chipped == true
        ? widget.sex == Icons.male
            ? AppLocalizations.of(context)!.chipped_m
            : AppLocalizations.of(context)!.chipped_f
        : '';

    TextStyle? textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          height: 1.4,
        );

    String about = '$description'
        '${description != '' && (vaccinated != '' || sterilized != '' || chipped != '' || features != '') ? '\n' : ''}'
        '${vaccinated != '' ? '$vaccinated ' : ''}'
        '${sterilized != '' ? '$sterilized ' : ''}'
        '${chipped != '' ? '\n🧬 $chipped ' : ''}'
        '${features != '' ? '\n⭐ $features' : ''}';

    int countBreakLine(String text) =>
        RegExp('[\r\n|\r|\n]+').allMatches(text).length;

    String truncateText(String text, int maxLength) {
      text.length <= maxLength ? text : null;
      int lastSpaceIndex = maxLength;
      while (lastSpaceIndex > 0 && text[lastSpaceIndex] != ' ') {
        lastSpaceIndex--;
      }
      lastSpaceIndex == 0 ? text.substring(0, maxLength) : null;
      return text.substring(0, lastSpaceIndex);
    }

    int textLimit = 90;
    bool moreThanTwoLines = countBreakLine(about) >= 2;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: GestureDetector(
        onTap: () => widget.toggle(),
        child: Stack(
          children: [
            /// CAT ABOUT NOT EXPANDED
            if (!widget.expanded)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: RichText(
                  text: TextSpan(
                    text: about.length > textLimit || moreThanTwoLines
                        ? truncateText(about, textLimit).replaceAllMapped(
                            RegExp(
                              '[\r\n|\r|\n]+',
                            ),
                            (match) => ' ',
                          )
                        : about,
                    style: textStyle,
                    children: [
                      if (about.length > textLimit || moreThanTwoLines)
                        TextSpan(
                          text: AppLocalizations.of(context)!.more_btn,
                          style: const TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

            /// CAT ABOUT EXPANDED
            if (widget.expanded)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.5,
                  ),
                  child: RawScrollbar(
                    thumbVisibility: true,
                    thumbColor: Colors.white.withOpacity(0.6),
                    radius: const Radius.circular(20),
                    thickness: 5,
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(about, style: textStyle),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
