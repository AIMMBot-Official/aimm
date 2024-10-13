import 'package:aimm/utils/constants.dart';
import 'package:aimm/utils/responsive.dart';
import 'package:aimm/views/home/easy_frame/easy_detail_widget.dart';
import 'package:aimm/widgets/gradient_button.dart';
import 'package:aimm/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EasyFrame extends StatefulWidget {
  const EasyFrame({super.key});

  @override
  State<EasyFrame> createState() => _EasyFrameState();
}

class _EasyFrameState extends State<EasyFrame> {
  String title_1 = "Volume Made ";
  String title_2 = "Easy";
  String infoText =
      "Our AI-powered platform simplifies trading by automating complex decisions. Let smart algorithms handle the work, delivering effortless and consistent results.";

  List<EasyDetailWidget> widgetList = [];

  @override
  void initState() {
    super.initState();
    widgetList = [
      const EasyDetailWidget(
        image: "assets/images/advance_trading_platform.png",
        title: "Advance Trading Platform",
        data:
            "Our platform leverages cutting-edge technology for seamless, efficient trading. It ensures fast execution and optimal performance in all market conditions. Experience a user-friendly interface designed for traders of all levels.",
      ),
      const EasyDetailWidget(
        image: "assets/images/ai_insights.png",
        title: "AI Insights",
        data:
            "Gain access to real-time, AI-driven market analysis for smarter decision-making. Our algorithms continuously monitor trends to identify profitable opportunities. Stay ahead with data-backed insights tailored to your trading goals.",
      ),
      const EasyDetailWidget(
        image: "assets/images/automated_strategies.png",
        title: "Automated Strategies",
        data:
            "Automate your trades with our intelligent, customizable strategies. Our AI bot adapts to market fluctuations, optimizing trades for maximum returns. Set your preferences and let the system work for you 24/7.",
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
              child: dataWidget(),
            ),
            const SizedBox(
              height: 60,
            ),
            _detailBoxes()
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
