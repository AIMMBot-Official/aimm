import 'package:aimm/utils/constants.dart';
import 'package:aimm/utils/responsive.dart';
import 'package:aimm/widgets/gradient_button.dart';
import 'package:aimm/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerFrame extends StatefulWidget {
  const BannerFrame({super.key});

  @override
  State<BannerFrame> createState() => _BannerFrameState();
}

class _BannerFrameState extends State<BannerFrame> {
  String title_1 = "AI-driven";
  String title_2 = " Volume ";
  String title_3 = "for everyone.";
  String buttonText = "Get started";

  _getPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.all(75);
    }

    return const EdgeInsets.all(20);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getPadding(),
      height: MediaQuery.of(context).size.height,
      constraints: const BoxConstraints(maxHeight: 750),
      child: banner(),
    );
  }

  Widget banner() {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/grid_bg.png")),
          gradient: const LinearGradient(
              colors: [Color(0xff02010300), Color(0xff010725)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xff585874), width: 1)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 50),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/banner_glow.png"),
            ),
            Center(
              child: dataWidget(),
            )
          ],
        ),
      ),
    );
  }

  _getDataWidgetPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 100, vertical: 20);
    }
    return const EdgeInsets.all(20);
  }

  Widget dataWidget() {
    return Container(
        padding: _getDataWidgetPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _titleWidget(),
            const SizedBox(height: 40),
            _customButton()
          ],
        ));
  }

  Widget _titleWidget() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: title_1,
              style: Responsive.getTextStyle(context,
                  dSize: 62, mSize: 35, weight: FontWeight.w600)),
          TextSpan(
              text: title_2,
              style: Responsive.getTextStyle(context,
                  dSize: 62,
                  mSize: 35,
                  weight: FontWeight.w600,
                  textColor: const Color(0xffFF3BFF))),
          TextSpan(
              text: title_3,
              style: Responsive.getTextStyle(context,
                  dSize: 62, mSize: 35, weight: FontWeight.w600)),
        ]));
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
