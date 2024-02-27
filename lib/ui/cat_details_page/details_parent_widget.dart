import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../objects/cat.dart';
import '../../objects/siteData.dart';
import '../../utilities/analitic_service.dart';
import '../../utilities/date_utils.dart';
import 'details_widgets/age_&_location.dart';
import 'details_widgets/expandable_description.dart';
import 'details_widgets/gradient_container.dart';
import 'details_widgets/image_indicators.dart';
import 'details_widgets/images_page_view.dart';
import 'details_widgets/name_&_sex.dart';
import 'details_widgets/side_button.dart';
import 'modal_widgets/days_shelter_modal.dart';
import 'modal_widgets/modal_widget.dart';

class DetailsParentWidget extends StatefulWidget {
  final Cat cat;
  final SiteData siteData;
  const DetailsParentWidget(
      {super.key, required this.cat, required this.siteData});

  @override
  State<DetailsParentWidget> createState() => _DetailsParentWidgetState();
}

class _DetailsParentWidgetState extends State<DetailsParentWidget> {
  final GlobalKey _key = GlobalKey();
  bool isExpanded = false;
  double? textHeight;
  int imgIndex = 0;
  final PageController imagesController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getSize());
  }

  @override
  Widget build(BuildContext context) {
    final SiteData site = widget.siteData;
    final TextTheme theme = Theme.of(context).textTheme;
    IconData sexIcon = widget.cat.sex == 'котик' ? Icons.male : Icons.female;
    final bool vaccinated = widget.cat.viralVaccineDate != null ? true : false;
    final bool sterilized = widget.cat.sterilizationDate != null ? true : false;
    final bool chipped = widget.cat.chipDate != null ? true : false;
    final bool adopted = widget.cat.adopted != null && widget.cat.adopted!;
    final bool description = widget.cat.description?.isNotEmpty == true;

    return Theme(
      data: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      child: GestureDetector(
        /// KEYBOARD IMAGES SWIPE
        onHorizontalDragEnd: handleHorizontalDragEnd,
        child: Stack(
          children: [
            /// IMAGES PAGE VIEW
            ImagesPageView(
              images: widget.cat.imagesUrls!,
              controller: imagesController,
              handleKeyboardNavigation: handleKeyboardNavigation,
              onPageChanged: (index) => setState(() => imgIndex = index!),
            ),

            /// SHADOW CONTAINER
            BottomGradientContainer(textHeight: textHeight),

            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// INFORMATION
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// SLIDER DOTS
                        ImageIndicators(
                          currentIndex: imgIndex,
                          numberOfIndicators: widget.cat.imagesUrls!.length,
                          controller: imagesController,
                        ),

                        Column(
                          key: _key,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// NAME and SEX
                            NameAndSexWidget(
                              sexIcon: sexIcon,
                              catName: widget.cat.name,
                              style: theme.headlineSmall!,
                              adopted: adopted,
                            ),

                            /// DESCRIPTION EXPANDABLE WIDGET
                            ExpandableDescription(
                              expanded: isExpanded,
                              description: widget.cat.description,
                              features: widget.cat.features,
                              vaccinated: vaccinated,
                              sterilized: sterilized,
                              chipped: chipped,
                              sex: sexIcon,
                              toggle: () =>
                                  description ? toggleDescription() : null,
                            ),

                            /// AGE AND LOCATION
                            AgeAndLocationWidget(
                              location: widget.cat.location,
                              birthDate: widget.cat.birthDate,
                              style: theme.titleMedium!,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// SIDE BUTTONS
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /// ADOPTED IN DAYS BUTTON
                        if (widget.cat.shelterArriveDate != null && adopted)
                          SideButton(
                            onPressed: () => showBottomModal(
                              context,
                              DaysInShelterWidget(
                                name: widget.cat.name,
                                adopted: adopted,
                                male: widget.cat.sex == 'котик',
                                days: DateUtilities.calculateDays(
                                  context,
                                  widget.cat.shelterArriveDate,
                                  endDate: widget.cat.adoptionDate,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'lib/assets/house_with_garden.png',
                                    height: 42,
                                  ),
                                  Text(
                                    DateUtilities.calculateDays(
                                        context, widget.cat.shelterArriveDate,
                                        endDate: widget.cat.adoptionDate,
                                        onlyNum: true),
                                    style: theme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),

                        /// DONATION BUTTON
                        if (!adopted)
                          SideButton(
                            onPressed: () {
                              showBottomModal(
                                context,
                                ModalWidget(
                                  appName: 'donation',
                                  openAppMessage: openAppMessage,
                                  content: [
                                    site.monoJar,
                                    site.privatCard,
                                    site.monoCard,
                                  ],
                                ),
                              );
                            },
                            child: Center(
                              child: Image.asset(
                                'lib/assets/donation.png',
                                fit: BoxFit.cover,
                                height: 42,
                              ),
                            ),
                          ),

                        /// SHARE BUTTON
                        SideButton(
                          onPressed: () {
                            AnalyticsService.logShare(widget.cat.name);
                            showBottomModal(
                              context,
                              ModalWidget(
                                appName: 'share',
                                openAppMessage: openAppMessage,
                                content: ['${site.siteLink}/${widget.cat.id}'],
                              ),
                            );
                          },
                          iconData: FontAwesomeIcons.share,
                        ),

                        /// MESSAGE BUTTON
                        if (!adopted)
                          SideButton(
                            onPressed: () {
                              showBottomModal(
                                context,
                                ModalWidget(
                                  appName: 'message',
                                  openAppMessage: openAppMessage,
                                  content: [site.telegramViber],
                                ),
                              );
                            },
                            iconData: FontAwesomeIcons.comment,
                          ),

                        /// PHONE BUTTON
                        if (!adopted)
                          SideButton(
                            iconData: FontAwesomeIcons.phoneFlip,
                            onPressed: () {
                              showBottomModal(
                                context,
                                ModalWidget(
                                  appName: 'phone',
                                  openAppMessage: openAppMessage,
                                  content: [site.workPhone],
                                ),
                              );
                            },
                          ),

                        /// SHELTER DAYS BUTTON
                        if (widget.cat.shelterArriveDate != null && !adopted)
                          SideButton(
                            iconData: FontAwesomeIcons.calendar,
                            onPressed: () => showBottomModal(
                              context,
                              DaysInShelterWidget(
                                male: false,
                                name: widget.cat.name,
                                days: DateUtilities.calculateDays(
                                    context, widget.cat.shelterArriveDate),
                              ),
                            ),
                            child: Text(
                              DateUtilities.calculateDays(
                                  context, widget.cat.shelterArriveDate,
                                  onlyNum: true),
                              style: theme.titleMedium,
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getSize() async {
    final RenderBox? renderBox =
        _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() => textHeight = renderBox.size.height);
    }
  }

  void toggleDescription() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getSize());
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void closeModal() => Navigator.of(context).pop();

  void showBottomModal(BuildContext context, Widget content) {
    showModalBottomSheet<void>(
      elevation: 0,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints(maxWidth: 500),
      builder: (BuildContext context) {
        return content;
      },
    );
  }

  void openAppMessage(String phoneNumber, String app) async {
    const String telegramUri = 'https://t.me/';
    const String viberUri = 'viber://chat/?number=';
    const String phoneUri = 'tel:';
    late Uri appUrl;
    if (app == 'telegram') {
      appUrl = Uri.parse('$telegramUri$phoneNumber');
    } else if (app == 'viber') {
      appUrl = Uri.parse('$viberUri$phoneNumber');
    } else {
      appUrl = Uri.parse('$phoneUri$phoneNumber');
    }

    try {
      if (await canLaunchUrl(appUrl)) {
        await launchUrl(
          appUrl,
          mode: LaunchMode.externalApplication,
        );
      } else {
        // Try the alternative URI
        Uri alternativeUrl = app == 'telegram'
            ? Uri.parse('$telegramUri$phoneNumber')
            : Uri.parse('$viberUri$phoneNumber');
        await launchUrl(
          alternativeUrl,
          mode: LaunchMode.externalApplication,
        );
        // check if opened, if not try window.open
        // If both URIs fail, open a web page as a last resort
        // html.window.open('https://web.telegram.org/a/#437373646', 'telegram');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      // Show the error modal.
      // showBottomModal(context, ShowError(error: error));
    }
  }

  void handleHorizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! > 0) {
      // Swiped right (move to the previous image)
      if (imagesController.page! > 0) {
        imagesController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        imagesController.animateToPage(
          widget.cat.imagesUrls!.length - 1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    } else if (details.primaryVelocity! < 0) {
      // Swiped left (move to the next image)
      if (imagesController.page! < widget.cat.imagesUrls!.length - 1) {
        imagesController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        imagesController.animateToPage(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void handleKeyboardNavigation(RawKeyEvent event) {
    if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
      // Check if nextPage can animate
      if (imagesController.page! < widget.cat.imagesUrls!.length - 1) {
        imagesController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        imagesController.animateToPage(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }
    if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
      // Check if previousPage can animate
      if (imagesController.page! > 0) {
        imagesController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        imagesController.animateToPage(
          widget.cat.imagesUrls!.length - 1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }
    if (event.isKeyPressed(LogicalKeyboardKey.space)) {
      // Check if nextPage can animate
      if (imagesController.page! < widget.cat.imagesUrls!.length - 1) {
        imagesController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        imagesController.animateToPage(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }
  }
}
