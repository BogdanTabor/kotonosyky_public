import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kotonosyky/ui/about_page/switch_language_button.dart';

class CatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPage;
  final int lastPageIndex;
  final PageController page;
  final bool lastPageCatList;
  final bool firstOpen;
  final VoidCallback setInitialVisitFalse;
  final VoidCallback setLastPageCatListFalse;

  const CatAppBar({
    Key? key,
    required this.currentPage,
    required this.lastPageIndex,
    required this.page,
    required this.lastPageCatList,
    required this.firstOpen,
    required this.setInitialVisitFalse,
    required this.setLastPageCatListFalse,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(62);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: null,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: preferredSize.height,
      bottom: PreferredSize(
          preferredSize: preferredSize,
          child: const Divider(
            height: 1,
            color: Colors.grey,
          )),
      title: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {
                if (lastPageCatList) {
                  page.jumpToPage(0);
                  setInitialVisitFalse();
                  setLastPageCatListFalse();
                } else {
                  page.jumpToPage(lastPageIndex);
                  setInitialVisitFalse();
                  setLastPageCatListFalse();
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 18, 10, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.kotonosyky,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                    if (currentPage == 1 || lastPageCatList && currentPage != 0)
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.home_outlined,
                          size: 18,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const LanguageSwitchButton(),
            const Spacer(),
            if (currentPage == 0 && !firstOpen)
              InkWell(
                onTap: () => page.jumpToPage(1),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.all_cats_here,
                      style: const TextStyle(fontSize: 13),
                    ),
                    IconButton(
                      onPressed: () {
                        page.jumpToPage(1);
                      },
                      icon: const Icon(Icons.collections_outlined),
                      iconSize: 24,
                    ),
                  ],
                ),
              ),
            if (currentPage == 0 && firstOpen)
              JumpingButton(
                pageController: page,
                setInitialVisitFalse: setInitialVisitFalse,
              ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

class JumpingButton extends StatefulWidget {
  final PageController pageController;
  final VoidCallback setInitialVisitFalse;

  const JumpingButton(
      {Key? key,
      required this.pageController,
      required this.setInitialVisitFalse})
      : super(key: key);

  @override
  JumpingButtonState createState() => JumpingButtonState();
}

class JumpingButtonState extends State<JumpingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;
  bool _mounted = false;

  @override
  void initState() {
    _mounted = true;
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _sizeAnimation =
        Tween<double>(begin: 0.95, end: 1.4).animate(curvedAnimation);
    _colorAnimation = ColorTween(begin: Colors.black87, end: Colors.black87)
        .animate(curvedAnimation);

    Future.delayed(const Duration(seconds: 2), () {
      if (_mounted) {
        setState(() {
          _colorAnimation = ColorTween(begin: Colors.amber, end: Colors.pink)
              .animate(curvedAnimation);
        });
        _animationController.repeat(reverse: true);
      }
    });

    Future.delayed(const Duration(seconds: 15), () {
      if (_mounted) {
        _animationController.dispose();
        setState(() {
          _colorAnimation =
              ColorTween(begin: Colors.black87, end: Colors.black87)
                  .animate(curvedAnimation);
        });
      }
    });
  }

  @override
  void dispose() {
    if (_mounted) {
      _animationController.dispose();
      _mounted = false; // Додайте цей рядок
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_animationController.isAnimating) {
          _animationController.stop();
          widget.setInitialVisitFalse();
        }
        widget.pageController.jumpToPage(1);
      },
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context)!.all_cats_here,
            style: const TextStyle(fontSize: 13),
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return ScaleTransition(
                scale: _sizeAnimation,
                child: IconButton(
                  onPressed: () {
                    if (_animationController.isAnimating) {
                      _animationController.stop();
                      widget.setInitialVisitFalse();
                    }
                    widget.pageController.jumpToPage(1);
                  },
                  icon: const Icon(Icons.collections_outlined),
                  color: _colorAnimation.value,
                  iconSize: 24,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
