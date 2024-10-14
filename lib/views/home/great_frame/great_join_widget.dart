import 'package:aimm/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/responsive.dart';
import '../../../widgets/gradient_button.dart';

class GreatJoinWidget extends StatefulWidget {
  const GreatJoinWidget({super.key});

  @override
  State<GreatJoinWidget> createState() => _GreatJoinWidgetState();
}

class _GreatJoinWidgetState extends State<GreatJoinWidget> {
  final _bgGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 0.7],
      colors: [Color(0xff0C125E), Colors.black]);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: Responsive.isDesktop(context) ? 1 : 2,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),

          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff252424)),
              borderRadius: BorderRadius.circular(20),
              gradient: _bgGradient),

          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      text: Text(
                        "Join Us And Simplify Your Trading",
                        textAlign: TextAlign.center,
                        style: Responsive.getTextStyle(context,
                            textColor: Colors.white,
                            weight: FontWeight.w600,
                            dSize: 31,
                            mSize: 30),
                      ),
                      gradient: const LinearGradient(colors: [
                        Color(0xffFFFFFF),
                        Color(0xffA7EAE5),
                        Color(0xffFFFFFF)
                      ]),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomOutlineButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      onPressed: () {},
                      child: Text(
                        "Get started",
                        style: Responsive.getTextStyle(context,
                            textColor: Colors.white,
                            weight: FontWeight.w600,
                            dSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // height: 200,
        ));
  }
}
