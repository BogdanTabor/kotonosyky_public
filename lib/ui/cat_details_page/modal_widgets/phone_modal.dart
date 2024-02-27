import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utilities/analitic_service.dart';
import 'copy_button.dart';
import 'or_spacer.dart';

class PhoneModalWidget extends StatefulWidget {
  final Function openAppMessage;
  final String content;
  const PhoneModalWidget(
      {Key? key, required this.openAppMessage, required this.content})
      : super(key: key);

  @override
  State<PhoneModalWidget> createState() => _PhoneModalWidgetState();
}

class _PhoneModalWidgetState extends State<PhoneModalWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            AnalyticsService.logButtonEvent('phone_phone');
            widget.openAppMessage(widget.content, 'phone');
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            fixedSize: const Size(240, 50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.call_koto,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        const OrSpacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CopyButton(content: widget.content),
            const SizedBox(width: 24),
            OutlinedButton(
              onPressed: () {
                AnalyticsService.logButtonEvent('copy_viber_number');
                widget.openAppMessage(widget.content, 'viber');
                Navigator.of(context).pop();
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                fixedSize: const Size(60, 60),
              ),
              child: const FaIcon(
                FontAwesomeIcons.viber,
                size: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 24),
            OutlinedButton(
              onPressed: () {
                AnalyticsService.logButtonEvent('copy_telegram_number');
                widget.openAppMessage(widget.content, 'telegram');
                Navigator.of(context).pop();
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                fixedSize: const Size(60, 60),
              ),
              child: const FaIcon(
                FontAwesomeIcons.telegram,
                size: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
