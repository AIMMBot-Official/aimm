import 'package:aimm/utils/constants.dart';
import 'package:aimm/utils/responsive.dart';
import 'package:aimm/views/home/great_frame/great_detail_widget.dart';
import 'package:aimm/views/home/great_frame/great_join_widget.dart';
import 'package:aimm/widgets/gradient_button.dart';
import 'package:aimm/widgets/gradient_text.dart';
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
      "We deliver AI-powered trading that combines real-time data, automated strategies, and intelligent risk management. Our platform ensures fast execution, security, and optimized performance, making it easy to achieve your financial goals.";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: dataWidget(),
          ),
          detailsGrid(),
        ],
      ),
    );
  }

  Widget detailsGrid() {
    return Container(
      padding: EdgeInsets.all(70),
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 700),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              GreatDetailWidget(
                  title: "Dynamic Token Price",
                  data:
                      "Implement adaptive strategies that automatically adjust your asset allocation based on market conditions and trends."),
              const SizedBox(
                height: 35,
              ),
              GreatDetailWidget(
                title: "Intelligent Chart Management ",
                data:
                    "Utilize AI algorithms to optimize your investment portfolio, balancing risk and reward for sustainable growth.",
                path: "assets/images/intelligent_chart_management.png",
              ),
            ],
          )),
          const SizedBox(
            width: 35,
          ),
          GreatJoinWidget(),
          const SizedBox(
            width: 35,
          ),
          Expanded(
              child: Column(
            children: [
              GreatDetailWidget(
                title: "Secure & Reliable",
                data:
                    "Benefit from advanced security and reliable execution, ensuring your investments are always protected.",
                path: "assets/images/secure_reliable.png",
              ),
              SizedBox(
                height: 35,
              ),
              GreatDetailWidget(
                  title: "Extended Support",
                  data:
                      "Our team is building additional features to maintain support levels, range, and generate profits with our bot. Early users will have access to these services at a discount!"),
            ],
          ))
        ],
      ),
    );
  }

  detailGridItem() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
      ),

      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: _textWidget("String title",
                "Implement adaptive strategies that automatically adjust your asset allocation based on market conditions and trends."),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight:
                      Radius.circular(20.0)), // Adjust the radius as needed
              child: Image.asset(
                "assets/images/secure_reliable.png",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      // height: 200,
    ));
  }

  _textWidget(String title, String data) {
    return Container(
        padding: EdgeInsets.only(left: 15, top: 15, right: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Responsive.getTextStyle(context,
                  textColor: Colors.white,
                  weight: FontWeight.w600,
                  dSize: 19,
                  mSize: 19),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              data,
              style: Responsive.getTextStyle(context,
                  textColor: Colors.white,
                  weight: FontWeight.w500,
                  dSize: 13,
                  mSize: 13),
            )
          ],
        ));
  }

  Widget dataWidget() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 750),
      child: Column(
        children: [_titleWidget(), const SizedBox(height: 10), _infoWidget()],
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
}
