import 'package:aimm/utils/responsive.dart';
import 'package:aimm/views/home/easy_frame/easy_detail_widget.dart';
import 'package:flutter/material.dart';

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
            "AIMM’s algorithms execute trades with random intervals, varying sizes, and multi-wallet distribution to perfectly replicate human-like trading patterns, eliminating any detectable bot behavior. By leveraging predictive optimization models, AIMM ensures seamless discreet volume.",
      ),
      const EasyDetailWidget(
        image: "assets/images/ai_insights.png",
        title: "Enhanced Experience",
        data:
            "AIMM delivers an enhanced automated trading experience by harnessing advanced AI models to dynamically manage trade volumes, ensuring maximum efficiency. Our predictive algorithms adapt to real-time market conditions, executing precision trades that optimize both volume and cost, giving users a seamless, high-performance market-making solution that operates around the clock.",
      ),
      const EasyDetailWidget(
        image: "assets/images/automated_strategies.png",
        title: "Gas Optimization",
        data:
            "Our gas optimization leverages real-time data and machine learning to execute trades during periods of low network congestion, significantly reducing gas fees. By continuously learning from Ethereum’s gas market fluctuations, AIMM strategically times transactions for maximum cost efficiency.",
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
      decoration: const BoxDecoration(
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
                duration: const Duration(milliseconds: 700),
                child: _detailBoxes())
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
