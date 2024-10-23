import 'package:aimm/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/responsive.dart';
import 'appbar_menuitem.dart';

class CustomAppBarNew extends StatefulWidget {
  const CustomAppBarNew(
      {super.key, this.bgColor = Colors.transparent, this.page});
  final Color bgColor;
  final String? page;

  @override
  State<CustomAppBarNew> createState() => _CustomAppBarNewState();
}

class _CustomAppBarNewState extends State<CustomAppBarNew> {
  getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 60, vertical: 15);
    } else {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          padding: getContainerPadding(),
          color: widget.bgColor,
          child: Responsive(mobile: _mobileView(), desktop: _desktopView()),
        ));
  }

  bool isClicked = false;
  _mobileView() {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        InkWell(
          onTap: () {
            setState(() {
              Scaffold.of(context).openDrawer();
            });
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Image.asset("assets/images/menu_button.png"),
        ),
      ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_title()])
    ]);
  }

  _desktopView() {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        _title(),
        const SizedBox(
          width: 75,
        ),
        _menuRow()
      ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _launchAIMMButton(),
            const SizedBox(
              width: 20,
            ),
            _launchAppButton(),
          ])
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

  _title() {
    return InkWell(
      onTap: () => {},
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 35, maxWidth: 60),
          child: Image.asset("assets/images/logo.png"),
        ),
        SizedBox(
          width: 5,
        ),
        Text("AIMM",
            style: Responsive.getTextStyle(context,
                dSize: 22, mSize: 21, dWeight: FontWeight.w600))
      ]),
    );
  }

  _menuRow() {
    return Row(
      children: [
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
}
