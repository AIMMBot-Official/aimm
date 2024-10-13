import 'package:aimm/utils/constants.dart';
import 'package:aimm/utils/responsive.dart';
import 'package:aimm/widgets/gradient_button.dart';
import 'package:aimm/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_appbar.dart';
import '../../../widgets/video_widget.dart';

class LandingFrame extends StatefulWidget {
  const LandingFrame({super.key});

  @override
  State<LandingFrame> createState() => _LandingFrameState();
}

class _LandingFrameState extends State<LandingFrame> {
  String title = "Seamless Liquidity,\n Smarter Trading";
  String subTitle = "Powered by AI";
  String buttonText = "Get started";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1.1,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Responsive(
                      mobile: VideoWidget(
                          videoUrl: "assets/videos/landing_bg_mobile.mp4"),
                      desktop: VideoWidget(
                          videoUrl: "assets/videos/landing_bg.mp4")))),
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          Center(
            child: dataWidget(),
          )
        ],
      ),
    );
  }

  Widget dataWidget() {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 40),
          _titleWidget(),
          const SizedBox(height: 10),
          _subTitleWidget(),
          const SizedBox(height: 40),
          _customButton()
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Responsive.getTextStyle(context,
          dSize: 62, mSize: 35, weight: FontWeight.w600),
    );
  }

  Widget _subTitleWidget() {
    return GradientText(
      text: Text(
        subTitle,
        style: Responsive.getTextStyle(context,
            dSize: 35, weight: FontWeight.w600),
      ),
      gradient: const LinearGradient(
        colors: gradientColors,
      ),
    );
  }

  Widget _customButton() {
    return CustomOutlineButton(
        child: Text(
          buttonText,
          style: Responsive.getTextStyle(context,
              textColor: Colors.white, weight: FontWeight.w400, dSize: 20),
        ),
        onPressed: () {
          print("object");
        });
  }
}
