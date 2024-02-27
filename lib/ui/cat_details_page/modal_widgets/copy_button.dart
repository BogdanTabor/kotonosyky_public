import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CopyButton extends StatefulWidget {
  final String content;
  final String? label;
  const CopyButton({Key? key, required this.content, this.label})
      : super(key: key);

  @override
  State<CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  bool copied = false;
  @override
  Widget build(BuildContext context) {
    bool label = widget.label != null;
    return OutlinedButton(
      onPressed: () {
        Clipboard.setData(ClipboardData(text: widget.content));
        setState(() => copied = true);
      },
      style: label
          ? OutlinedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              elevation: 0,
              fixedSize: const Size(230, 50),
            )
          : OutlinedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              fixedSize: const Size(60, 60),
            ),
      child: !label
          ? Icon(
              copied ? Icons.check_rounded : Icons.copy,
              size: 24,
              color: Colors.black38,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  !copied
                      ? '${AppLocalizations.of(context)!.copy_btn} ${widget.label}'
                      : AppLocalizations.of(context)!.copied_btn,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(width: 6),
                Icon(
                  copied ? Icons.check_rounded : Icons.copy,
                  size: 24,
                  color: Colors.black38,
                ),
              ],
            ),
    );
  }
}
