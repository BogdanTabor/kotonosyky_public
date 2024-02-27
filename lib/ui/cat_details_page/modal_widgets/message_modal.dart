import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utilities/analitic_service.dart';
import 'copy_button.dart';
import 'or_spacer.dart';

class MessageModalWidget extends StatefulWidget {
  final Function openAppMessage;
  final String content;
  const MessageModalWidget(
      {Key? key, required this.openAppMessage, required this.content})
      : super(key: key);

  @override
  State<MessageModalWidget> createState() => _MessageModalWidgetState();
}

class _MessageModalWidgetState extends State<MessageModalWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                AnalyticsService.logButtonEvent('message_viber');
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
                AnalyticsService.logButtonEvent('message_telegram');
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
        const OrSpacer(),
        CopyButton(
          content: widget.content,
          label: AppLocalizations.of(context)!.number,
        ),
      ],
    );
  }
}
