import 'package:aimm/utils/responsive.dart';
import 'package:aimm/views/home/great_frame/great_detail_widget.dart';
import 'package:aimm/views/home/great_frame/great_join_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreatFrame extends StatefulWidget {
  const GreatFrame({super.key});

  @override
  State<GreatFrame> createState() => _GreatFrameState();
}

class _GreatFrameState extends State<GreatFrame> {
  String title_1 = "What makes us ";
  String title_2 = "Great";
  String infoText =
      "We deliver AI-powered volume generation that combines real-time data, automated strategies, and intelligent risk management. Our platform ensures fast execution, security, and optimized performance, making it easy to achieve your financial goals.";
  late List<GreatDetailWidget> widgetList;

  @override
  void initState() {
    widgetList = [
      const GreatDetailWidget(
          title: "Dynamic Token Price",
          data:
              "Implement adaptive strategies that automatically adjust your asset allocation based on market conditions and trends."),
      const GreatDetailWidget(
        title: "Intelligent Chart Management ",
        data:
            "Utilize AI algorithms to optimize your investment portfolio, balancing risk and reward for sustainable growth.",
        path: "assets/images/intelligent_chart_management.png",
      ),
      const GreatDetailWidget(
        title: "Secure & Reliable",
        data:
            "Benefit from advanced security and reliable execution, ensuring your investments are always protected.",
        path: "assets/images/secure_reliable.png",
      ),
      const GreatDetailWidget(
          title: "Extended Support",
          data:
              "Our team is building additional features to maintain support levels, range, and generate profits with our bot. Early users will have access to these services at a discount!")
    ];
    super.initState();
  }

  _getPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.all(75);
    }
    return const EdgeInsets.symmetric(horizontal: 20, vertical: 75);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getPadding(),
      child: Column(
        children: [
          Center(
            child: dataWidget(),
          ),
          const SizedBox(
            height: 70,
          ),
          Responsive(
              mobile: _detailsGridMobile(), desktop: _detailsGridDesktop()),
        ],
      ),
    );
  }

  Widget dataWidget() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 750),
      child: Column(
        children: [_titleWidget(), const SizedBox(height: 15), _infoWidget()],
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

  _detailsGridDesktop() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        constraints: const BoxConstraints(maxHeight: 700),
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                widgetList[0],
                const SizedBox(
                  height: 35,
                ),
                widgetList[1],
              ],
            )),
            const SizedBox(
              width: 35,
            ),
            const GreatJoinWidget(),
            const SizedBox(
              width: 35,
            ),
            Expanded(
                child: Column(
              children: [
                widgetList[2],
                const SizedBox(
                  height: 35,
                ),
                widgetList[3],
              ],
            ))
          ],
        ));
  }

  _detailsGridMobile() {
    return Container(
        height: 1800,
        child: Column(
          children: [
            widgetList[0],
            const SizedBox(
              height: 35,
            ),
            widgetList[1],
            const SizedBox(
              height: 35,
            ),
            const GreatJoinWidget(),
            const SizedBox(
              height: 35,
            ),
            widgetList[2],
            const SizedBox(
              height: 35,
            ),
            widgetList[3],
          ],
        ));
  }
}
