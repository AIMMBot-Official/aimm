import 'package:aimm/utils/constants.dart';
import 'package:aimm/utils/responsive.dart';
import 'package:aimm/widgets/FadeInListWidget.dart';
import 'package:aimm/widgets/custom_appbar_new.dart';
import 'package:aimm/widgets/gradient_button.dart';
import 'package:aimm/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/video_widget.dart';

class LandingFrame extends StatefulWidget {
  const LandingFrame({super.key});

  @override
  State<LandingFrame> createState() => _LandingFrameState();
}

class _LandingFrameState extends State<LandingFrame> {
  String title = "Seamless Chart,\n Smarter Volume";
  String subTitle = "Powered by AI";
  String buttonText = "Get started";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1.1,
      constraints: const BoxConstraints(maxHeight: 600),
      child: Stack(
        children: [
          _bgVideo(),
          _overlay(),
          Column(children: [
            const CustomAppBarNew(
              page: Routes.home,
            ),
            FadeInListItem(
                duration: const Duration(milliseconds: 1500),
                child: dataWidget())
          ]),
        ],
      ),
    );
  }

  _bgVideo() {
    return Responsive(
        desktop: Positioned(
            top: 0,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const VideoWidget(
                    videoUrl: "assets/videos/landing_bg.mp4"))),
        mobile: Positioned(
            bottom: 0,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const VideoWidget(
                    videoUrl: "assets/videos/landing_bg_mobile.mov"))));
  }

  _overlay() {
    return Container(
      color: Colors.black.withOpacity(0.80),
    );
  }

  Widget dataWidget() {
    return Center(
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
