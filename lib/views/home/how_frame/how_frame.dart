import 'package:aimm/utils/constants.dart';
import 'package:aimm/utils/responsive.dart';
import 'package:aimm/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

import '../../../widgets/FadeInListWidget.dart';

class HowFrame extends StatefulWidget {
  const HowFrame({super.key});

  @override
  State<HowFrame> createState() => _HowFrameState();
}

class _HowFrameState extends State<HowFrame> {
  String title_1 = "How It ";
  String title_2 = "Works";
  String subTitle = "AI at the core";
  String buttonText = "Get started";
  String infoText =
      "Our AI-driven bot intelligently analyzes DEX transactions in real-time, dynamically adjusting prices and managing volume to enhance your token's market presence and stability.";

  _getPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.all(75);
    }
    return const EdgeInsets.symmetric(horizontal: 20, vertical: 75);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height,
      // constraints: BoxConstraints(maxHeight: 1500),
      padding: _getPadding(),
      child: Column(
        children: [
          Center(
            child: FadeInListItem(child: dataWidget()),
          ),
          const SizedBox(
            height: 75,
          ),
          Image.asset(
            "assets/images/how_image.png",
            filterQuality: FilterQuality.high,
          )
        ],
      ),
    );
  }

  Widget dataWidget() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 700),
      child: Column(
        children: [
          _titleWidget(),
          const SizedBox(height: 10),
          _subTitleWidget(),
          const SizedBox(height: 40),
          _infoWidget()
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return RichText(
        maxLines: 2,
        textAlign: TextAlign.center,
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: title_1,
              style: Responsive.getTextStyle(context,
                  dSize: 55, mSize: 30, weight: FontWeight.w600)),
          TextSpan(
              text: title_2,
              style: Responsive.getTextStyle(context,
                  dSize: 55,
                  mSize: 30,
                  weight: FontWeight.w600,
                  textColor: const Color(0xffFF3BFF))),
        ]));
  }

  Widget _subTitleWidget() {
    return GradientText(
      text: Text(
        subTitle,
        style: Responsive.getTextStyle(context,
            dSize: 30, weight: FontWeight.w600),
      ),
      gradient: const LinearGradient(
        colors: gradientColors,
      ),
    );
  }

  Widget _infoWidget() {
    return Text(
      infoText,
      textAlign: TextAlign.center,
      style: Responsive.getTextStyle(context,
          dSize: 16, mSize: 14, weight: FontWeight.w500),
    );
  }
}
