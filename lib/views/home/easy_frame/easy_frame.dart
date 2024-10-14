import 'package:aimm/utils/constants.dart';
import 'package:aimm/utils/responsive.dart';
import 'package:aimm/views/home/easy_frame/easy_detail_widget.dart';
import 'package:aimm/widgets/gradient_button.dart';
import 'package:aimm/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/FadeInListWidget.dart';

class EasyFrame extends StatefulWidget {
  const EasyFrame({super.key});

  @override
  State<EasyFrame> createState() => _EasyFrameState();
}

class _EasyFrameState extends State<EasyFrame> {
  String title_1 = "Volume Made ";
  String title_2 = "Easy";
  String infoText =
      "Our AI-powered platform simplifies volume by automating complex human-like decisions. Let our smart algorithms handle the work, delivering effortless and consistent results.";

  late List<EasyDetailWidget> widgetList;

  @override
  void initState() {
    super.initState();
    widgetList = [
      const EasyDetailWidget(
        image: "assets/images/advance_trading_platform.png",
        title: "Human-like Volume",
        data:
            "We are using advanced zkMesh technology to ensure that the generated volume is as humanly as possible. Therefore, it is difficult to distinguish between a bot TX and a human TX.",
      ),
      const EasyDetailWidget(
        image: "assets/images/ai_insights.png",
        title: "Enhanced Experience",
        data:
            "Our bots do the hard work of identifying size of buy/sell TX, frequency, time, etc. to simply the user experience. At the same time, the options for endless customization are also available.",
      ),
      const EasyDetailWidget(
        image: "assets/images/automated_strategies.png",
        title: "Gas Optimization",
        data:
            "Our bots are calibrated to ensure optimized volume generation with minimal loss in funds due to high gas fees. The TX size and frequency are automatically adjusted as needed 24/7.",
      )
    ];
  }

  _getPadding() {
    if (Responsive.isMobile(context)) {
      return const EdgeInsets.all(20);
    }
    return const EdgeInsets.symmetric(horizontal: 60, vertical: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 1.4,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/easy_bg.png"), fit: BoxFit.fill)),
      child: Padding(
        padding: _getPadding(),
        child: Column(
          children: [
            Center(
              child: FadeInListItem(child: dataWidget()),
            ),
            const SizedBox(
              height: 60,
            ),
            FadeInListItem(
                duration: Duration(milliseconds: 700), child: _detailBoxes())
          ],
        ),
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
          _infoWidget(),
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

  Widget _infoWidget() {
    return Text(
      infoText,
      textAlign: TextAlign.center,
      style: Responsive.getTextStyle(context,
          dSize: 16, mSize: 14, weight: FontWeight.w500),
    );
  }

  _detailBoxes() {
    return Responsive(
        mobile: Column(
          children: [
            for (int i = 0; i < widgetList.length; i++)
              Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: widgetList[i])
          ],
        ),
        desktop: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 6,
              child: widgetList[0],
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: widgetList[1],
                )),
            const Spacer(
              flex: 1,
            ),
            Expanded(flex: 6, child: widgetList[2])
          ],
        ));
  }
}
