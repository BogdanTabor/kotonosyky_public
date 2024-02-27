import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utilities/analitic_service.dart';

class DonationsModalWidget extends StatefulWidget {
  final List<String> content;

  const DonationsModalWidget({Key? key, required this.content})
      : super(key: key);

  @override
  State<DonationsModalWidget> createState() => _DonationsModalWidgetState();
}

class _DonationsModalWidgetState extends State<DonationsModalWidget> {
  bool copied = false;
  bool copied2 = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Tooltip(
          message: AppLocalizations.of(context)!.fill_up_mono,
          child: InkWell(
            onTap: () async {
              AnalyticsService.logButtonEvent('donate');
              Uri uri = Uri.parse(widget.content[0]);
              try {
                await launchUrl(uri)
                    .then((value) => Navigator.of(context).pop());
              } catch (error) {
                if (kDebugMode) {
                  print(error);
                }
              }
            },
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/monojar.png',
                  height: 62,
                ),
                Text(AppLocalizations.of(context)!.fill_up_mono_),
              ],
            ),
          ),
        ),
        const SizedBox(width: 24),
        Text(AppLocalizations.of(context)!.or),
        const SizedBox(width: 24),
        Column(
          children: [
            Row(
              children: [
                Tooltip(
                  message: AppLocalizations.of(context)!.copy_number,
                  child: OutlinedButton(
                    onPressed: () {
                      //copy and message
                      Clipboard.setData(ClipboardData(text: widget.content[1]));
                      setState(() {
                        copied = true;
                        copied2 = false;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      fixedSize: const Size(80, 80),
                    ),
                    child: !copied
                        ? Image.asset(
                            'lib/assets/privat.png',
                            height: 48,
                          )
                        : const Icon(
                            Icons.check_rounded,
                            size: 24,
                            color: Colors.black38,
                          ),
                  ),
                ),
                const SizedBox(width: 24),
                Tooltip(
                  message: AppLocalizations.of(context)!.copy_number,
                  child: OutlinedButton(
                    onPressed: () {
                      //copy and message
                      Clipboard.setData(ClipboardData(text: widget.content[2]));
                      setState(() {
                        copied = false;
                        copied2 = true;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      fixedSize: const Size(80, 80),
                    ),
                    child: !copied2
                        ? Image.asset(
                            'lib/assets/monobank.png',
                            height: 48,
                          )
                        : const Icon(
                            Icons.check_rounded,
                            size: 24,
                            color: Colors.black38,
                          ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(AppLocalizations.of(context)!.copy_card_num),
          ],
        ),
      ],
    );
  }
}
