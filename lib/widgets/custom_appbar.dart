import 'package:aimm/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
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
        automaticallyImplyLeading: true,
        floating: true,
        pinned: false,
        snap: true,
        backgroundColor: Colors.black.withOpacity(0.8),
        elevation: 2,
        scrolledUnderElevation: 2,
        shadowColor: Colors.black,
        leadingWidth: Responsive.isDesktop(context) ? 400 : 70,
        toolbarHeight: Responsive.isDesktop(context) ? 80 : 60,
        centerTitle: true,
        actions: Responsive.isDesktop(context)
            ? [
                CustomOutlineButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 9, horizontal: 25),
                  onPressed: () {},
                  isGradient: false,
                  child: Text(
                    "\$AIMM",
                    style: Responsive.getTextStyle(context,
                        textColor: Colors.white,
                        weight: FontWeight.w600,
                        dSize: 15),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                CustomOutlineButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 9, horizontal: 25),
                  onPressed: () {},
                  child: Text(
                    "Launch App",
                    style: Responsive.getTextStyle(context,
                        textColor: Colors.white,
                        weight: FontWeight.w600,
                        dSize: 15),
                  ),
                ),
                const SizedBox(
                  width: 40,
                )
              ]
            : []);
  }
}
