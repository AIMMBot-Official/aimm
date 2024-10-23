import 'package:aimm/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/responsive.dart';
import 'appbar_menuitem.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Colors.black,
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Stack(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("AIMM",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400))
              ])
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppBarMenuItem(
                  text: "Home",
                  onTap: () {
                    print("home");
                  }),
              const SizedBox(height: 20),
              AppBarMenuItem(
                  text: "Docs",
                  onTap: () {
                    print("home");
                  }),
              const SizedBox(height: 20),
              AppBarMenuItem(
                  text: "Whitepaper",
                  onTap: () {
                    print("home");
                  })
            ]),
          ),
          const Divider(
            height: 50,
            indent: 0,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: _launchAppButton(),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: _launchAIMMButton(),
          )
        ],
      ),
    );
  }

  _menuListItem(String title, bool selected, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: selected
            ? const VerticalDivider(
                thickness: 4,
                width: 2,
                color: Color(0xff12BB5F),
              )
            : const SizedBox(
                height: 0,
                width: 0,
              ),
        title: Text(
          title,
          style: Responsive.getTextStyle(context,
              weight: selected ? FontWeight.w600 : FontWeight.w400,
              mSize: 18,
              dSize: 18,
              textColor: Colors.white),
        ),
        splashColor: const Color(0xff12BB5F).withOpacity(0.2),
        onTap: onTap,
      ),
    );
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
