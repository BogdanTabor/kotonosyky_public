import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kotonosyky/ui/cat_details_page/modal_widgets/phone_modal.dart';

import 'copy_button.dart';
import 'donations_modal.dart';
import 'message_modal.dart';

class ModalWidget extends StatefulWidget {
  final String appName;
  final List<String> content;
  final Function openAppMessage;
  const ModalWidget({
    super.key,
    required this.appName,
    required this.content,
    required this.openAppMessage,
  });

  @override
  State<ModalWidget> createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget> {
  bool copied = false;
  String appLabel = '';
  @override
  Widget build(BuildContext context) {
    String name = widget.appName;

    Map<String, String> appLabels = {
      'phone': AppLocalizations.of(context)!.phone,
      'message': AppLocalizations.of(context)!.message,
      'share': AppLocalizations.of(context)!.share,
    };

    appLabel = appLabels[name] ?? AppLocalizations.of(context)!.help;

    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                children: [
                  Text(appLabel,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  if (name == 'donation')
                    DonationsModalWidget(content: widget.content),
                  if (name == 'message')
                    MessageModalWidget(
                      openAppMessage: widget.openAppMessage,
                      content: widget.content.first,
                    ),
                  if (name == 'phone')
                    PhoneModalWidget(
                      openAppMessage: widget.openAppMessage,
                      content: widget.content.first,
                    ),
                  if (name == 'share')
                    Expanded(
                      child: SelectableText(
                        widget.content.first,
                        maxLines: 3,
                      ),
                    ),
                  if (name == 'share')
                    CopyButton(
                      content: widget.content.first,
                      label: AppLocalizations.of(context)!.link,
                    ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close_rounded)),
        )
      ],
    );
  }
}
