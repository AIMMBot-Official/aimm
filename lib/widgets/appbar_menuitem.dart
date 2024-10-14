import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/responsive.dart';

class AppBarMenuItem extends StatefulWidget {
  const AppBarMenuItem({super.key, required this.text, required this.onTap});
  final String text;
  final Function() onTap;
  @override
  State<AppBarMenuItem> createState() => _AppBarMenuItemState();
}

class _AppBarMenuItemState extends State<AppBarMenuItem> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            _hover = value;
          });
        },
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: Responsive.getTextStyle(context,
              weight: _hover ? FontWeight.w500 : FontWeight.w300, dSize: 14),
        ));
  }
}
