import 'package:aimm/utils/constants.dart';
import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class CustomOutlineButton extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback onPressed;
  final bool isGradient;

  const CustomOutlineButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.isGradient = true,
      this.padding = const EdgeInsets.symmetric(vertical: 18, horizontal: 30)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isGradient ? gradientColors : [Colors.white, Colors.white],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: padding,
            side: BorderSide(
                color: isGradient ? Colors.transparent : Colors.white,
                width: 0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            backgroundColor: Colors.black),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
