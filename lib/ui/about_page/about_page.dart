import 'dart:html' as html;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../objects/siteData.dart';
import '../../utilities/language_provider.dart';
import 'markdown_loader.dart';

class AboutPage extends StatefulWidget {
  final PageController pageController;
  final SiteData siteData;

  const AboutPage(
      {super.key, required this.pageController, required this.siteData});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final List<ExpansionPanelItem> _items = [];
  final List<ExpansionPanelItem> _firstItem = [];

  @override
  void initState() {
    super.initState();
    context.read<LanguageProvider>().addListener(_onLanguageChange);
    _loadMarkdownContent();
  }

  // todo this code must work but not.
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   context.read<LanguageProvider>().removeListener(_onLanguageChange);
  // }

  @override
  void dispose() {
    context.read<LanguageProvider>().addListener(_onLanguageChange);
    super.dispose();
  }

  void _onLanguageChange() {
    if (widget.pageController.page! < 1) {
      _loadMarkdownContent();
    }
  }

  @override
  Widget build(BuildContext ctx) {
    final SiteData site = widget.siteData;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 390;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
            child: Column(
              children: [
                if (isSmallScreen)
                  Image.asset(
                    'lib/assets/kotonosyky_icon.png',
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                Row(
                  children: [
                    if (!isSmallScreen)
                      Image.asset(
                        'lib/assets/kotonosyky_icon.png',
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                          crossAxisAlignment: !isSmallScreen
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SocialMediaLinks(
                              facebook: site.facebook,
                              tiktok: site.tiktok,
                              instagram: site.instagram,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ShareButton(siteLink: site.siteLink),
                                const SizedBox(width: 4),
                                DonationsButton(donationLink: site.donationLink)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    if (_items.isNotEmpty)
                      Markdown(
                        data: '${_firstItem.first.headerValue}\n'
                            '${_firstItem.first.body}',
                        shrinkWrap: true,
                        selectable: true,
                        physics: const NeverScrollableScrollPhysics(),
                        bulletBuilder: (index, style) {
                          String imageName = Random().nextBool()
                              ? 'lib/assets/point.png'
                              : 'lib/assets/point_2.png';
                          return Container(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              imageName,
                              height: 13,
                              fit: BoxFit.fitHeight,
                            ),
                          );
                        },
                        onTapLink: (String text, String? href, String title) {
                          if (href != null) {
                            launchUrl(Uri.parse(href));
                          }
                        },
                        styleSheet:
                            MarkdownStyleSheet.fromTheme(Theme.of(context))
                                .copyWith(
                          h2: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: 0.1,
                          ),
                          p: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ExpansionPanelList(
                      elevation: 1,
                      expandedHeaderPadding: EdgeInsets.zero,
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _items[index].isExpanded = !isExpanded;
                        });
                      },
                      children: _items.map<ExpansionPanel>((item) {
                        return ExpansionPanel(
                          canTapOnHeader: true,
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(
                                item.headerValue,
                                style: const TextStyle(color: Colors.black87),
                              ),
                            );
                          },
                          body: Markdown(
                            data: item.body,
                            shrinkWrap: true,
                            selectable: true,
                            physics: const NeverScrollableScrollPhysics(),
                            bulletBuilder: (index, style) {
                              String imageName = Random().nextBool()
                                  ? 'lib/assets/point.png'
                                  : 'lib/assets/point_2.png';
                              return Image.asset(
                                imageName,
                                height: 12,
                                fit: BoxFit.contain,
                              );
                            },
                            onTapLink:
                                (String text, String? href, String title) {
                              if (href != null) {
                                launchUrl(Uri.parse(href));
                              }
                            },
                            styleSheet:
                                MarkdownStyleSheet.fromTheme(Theme.of(context))
                                    .copyWith(
                              h2: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              p: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  child: MaterialButton(
                    onPressed: () {
                      widget.pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: const JumpingTextIcon(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Load content from about.md file
  Future<void> _loadMarkdownContent() async {
    final List<ExpansionPanelItem> items =
        await MarkdownLoader.loadMarkdownContent(context);

    _firstItem.clear();
    _firstItem.addAll(items.take(1));

    _items.clear();
    _items.addAll(items.skip(1));

    if (mounted) {
      setState(() {});
    }
  }
}

class ExpansionPanelItem {
  final String headerValue;
  final String body;
  bool isExpanded;

  ExpansionPanelItem({
    required this.headerValue,
    required this.body,
    this.isExpanded = false,
  });
}

class SocialMediaLinks extends StatelessWidget {
  final String facebook;
  final String tiktok;
  final String instagram;
  const SocialMediaLinks({
    required this.facebook,
    required this.tiktok,
    required this.instagram,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSocialMediaButton(
            iconData: FontAwesomeIcons.facebook,
            url: facebook,
          ),
          _buildSocialMediaButton(
            iconData: FontAwesomeIcons.tiktok,
            url: tiktok,
          ),
          _buildSocialMediaButton(
            iconData: FontAwesomeIcons.instagram,
            url: instagram,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaButton(
      {required IconData iconData, required String url}) {
    return InkWell(
      onTap: () => html.window.open(url, 'social'),
      child: FaIcon(iconData, size: 32),
    );
  }
}

class DonationsButton extends StatelessWidget {
  final String donationLink;
  const DonationsButton({required this.donationLink, super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: donationLink, //'Відкрити реквізити',
      child: ElevatedButton(
        onPressed: () => html.window.open(donationLink, 'donations'),
        // style: ElevatedButton.styleFrom(
        //   elevation: 0,
        //   maximumSize: const Size(125, 35),
        //   minimumSize: const Size(125, 35),
        // ),
        child: Text(
          AppLocalizations.of(context)!.help_btn,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class ShareButton extends StatefulWidget {
  final String siteLink;
  const ShareButton({required this.siteLink, super.key});
  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  bool isShared = false;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.siteLink, //'Копіювати посилання',
      child: OutlinedButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(
            text: widget.siteLink,
          ));
          setState(() => isShared = true);
        },
        // style: OutlinedButton.styleFrom(
        //   backgroundColor: Colors.grey.shade200,
        //   elevation: 0,
        //   fixedSize: const Size(125, 25),
        // ),
        child: Text(
          isShared
              ? AppLocalizations.of(context)!.copied_btn
              : AppLocalizations.of(context)!.share_btn,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                color: Colors.black87,
              ),
        ),
      ),
    );
  }
}

class JumpingTextIcon extends StatefulWidget {
  const JumpingTextIcon({super.key});

  @override
  JumpingTextIconState createState() => JumpingTextIconState();
}

class JumpingTextIconState extends State<JumpingTextIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _positionAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _positionAnimation.value),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.move_to_all,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        );
      },
    );
  }
}
