import 'package:aimm/widgets/appbar_menuitem.dart';
import 'package:aimm/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/responsive.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        automaticallyImplyLeading: false,
        floating: true,
        pinned: false,
        snap: true,
        backgroundColor: Colors.black.withOpacity(0.8),
        elevation: 2,
        scrolledUnderElevation: 2,
        shadowColor: Colors.black,
        leadingWidth: Responsive.isDesktop(context) ? 400 : 70,
        toolbarHeight: Responsive.isDesktop(context) ? 80 : 60,
        centerTitle: false,
        title: Responsive(mobile: _mobileTitle(), desktop: _desktopTitle()),
        actions: Responsive.isDesktop(context)
            ? [
                _launchAIMMButton(),
                const SizedBox(
                  width: 18,
                ),
                _launchAppButton(),
                const SizedBox(
                  width: 40,
                )
              ]
            : [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: _launchAIMMButton()),
              ]);
  }

  _desktopTitle() {
    return Row(
      children: [
        const SizedBox(
          width: 40,
        ),
        AppBarMenuItem(
            text: "Home",
            onTap: () {
              print("home");
            }),
        const SizedBox(width: 20),
        AppBarMenuItem(
            text: "Docs",
            onTap: () {
              print("home");
            }),
        const SizedBox(width: 20),
        AppBarMenuItem(
            text: "Whitepaper",
            onTap: () {
              print("home");
            })
      ],
    );
  }

  bool isClicked = false;

  _mobileTitle() {
    return Row(children: [
      const SizedBox(
        width: 20,
      ),
      InkWell(
        onTap: () {
          setState(() {
            isClicked = !isClicked;
            if (isClicked) Scaffold.of(context).openDrawer();
          });
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Transform.flip(
          flipX: isClicked,
          child: Image.asset("assets/images/menu_button.png"),
        ),
      ),
    ]);
  }

  _launchAIMMButton() {
    return CustomOutlineButton(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 25),
      onPressed: () {},
      isGradient: false,
      child: Text(
        "\$AIMM",
        style: Responsive.getTextStyle(context,
            textColor: Colors.white,
            weight: FontWeight.w600,
            dSize: 15,
            mSize: 12),
      ),
    );
  }

  _launchAppButton() {
    return CustomOutlineButton(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 25),
      onPressed: () {},
      child: Text(
        "Launch App",
        style: Responsive.getTextStyle(context,
            textColor: Colors.white,
            weight: FontWeight.w600,
            dSize: 15,
            mSize: 12),
      ),
    );
  }
}
