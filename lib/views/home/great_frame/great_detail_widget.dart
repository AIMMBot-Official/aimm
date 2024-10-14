import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/responsive.dart';

class GreatDetailWidget extends StatefulWidget {
  const GreatDetailWidget(
      {super.key, required this.title, required this.data, this.path});
  final String title;
  final String data;
  final String? path;

  @override
  State<GreatDetailWidget> createState() => _GreatDetailWidgetState();
}

class _GreatDetailWidgetState extends State<GreatDetailWidget> {
  final _bgGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 0.7],
      colors: [Color(0xff0C125E), Colors.black]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff252424)),
          borderRadius: BorderRadius.circular(20),
          gradient: _bgGradient),

      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: _textWidget(),
          ),
          widget.path != null
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                            20.0)), // Adjust the radius as needed
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: 100, maxWidth: 120),
                      child: Image.asset(
                        widget.path!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
      // height: 200,
    ));
  }

  _textWidget() {
    return Container(
        padding: EdgeInsets.only(left: 15, top: 15, right: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
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
              widget.data,
              style: Responsive.getTextStyle(context,
                  textColor: Colors.white,
                  weight: FontWeight.w400,
                  dSize: 14,
                  mSize: 14),
            )
          ],
        ));
  }
}
