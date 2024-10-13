import 'package:aimm/utils/responsive.dart';
import 'package:aimm/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class CustomFooter extends StatefulWidget {
  const CustomFooter({super.key});

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(75),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(flex: 1, child: _infoWidget()),
          Expanded(flex: 1, child: _linksWidget())
        ],
      ),
    );
  }

  _infoWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Seamless Liquidity, Smarter Trading",
          style: Responsive.getTextStyle(context,
              weight: FontWeight.w400,
              textColor: Colors.white,
              dSize: 14,
              mSize: 14),
        ),
        Text(
          "AIMM @ 2024 | All rights reserved",
          style: Responsive.getTextStyle(context,
              weight: FontWeight.w400,
              textColor: Colors.white,
              dSize: 14,
              mSize: 14),
        )
      ],
    );
  }

  _linksWidget() {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        footerMenuColumn("Contact", [
          MenuItem(name: "X(Twitter)", onTap: () {}),
          MenuItem(name: "Reddit", onTap: () {}),
          MenuItem(name: "Telegram", onTap: () {}),
          MenuItem(name: "info@aimm.system", onTap: () {}),
        ]),
        footerMenuColumn("Menu", [
          MenuItem(name: "Home", onTap: () {}),
          MenuItem(name: "About", onTap: () {}),
          MenuItem(name: "Features", onTap: () {}),
          MenuItem(name: "How it works", onTap: () {}),
        ]),
        footerMenuColumn("Token", [
          MenuItem(name: "Eterscan", onTap: () {}),
          MenuItem(name: "Dextools", onTap: () {}),
        ]),
      ],
    );
  }

  footerMenuColumn(String title, List<MenuItem> menuItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Responsive.getTextStyle(context,
              weight: FontWeight.w500,
              textColor: Colors.white,
              dSize: 16,
              mSize: 16),
        ),
        SizedBox(
          height: 15,
        ),
        for (int i = 0; i < menuItems.length; i++)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              menuItems[i].name,
              style: Responsive.getTextStyle(context,
                  weight: FontWeight.w400,
                  textColor: Colors.white.withOpacity(0.5),
                  dSize: 13,
                  mSize: 13),
            ),
          )
      ],
    );
  }
}
