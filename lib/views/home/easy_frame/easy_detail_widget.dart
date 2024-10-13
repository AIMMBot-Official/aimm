import 'package:aimm/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EasyDetailWidget extends StatefulWidget {
  const EasyDetailWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.data});
  final String title;
  final String data;
  final String image;

  @override
  State<EasyDetailWidget> createState() => _EasyDetailWidgetState();
}

class _EasyDetailWidgetState extends State<EasyDetailWidget> {
  final _bgGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xff071354), Colors.black]);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 530,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff585874), width: 0.8),
          borderRadius: BorderRadius.circular(19.45),
          gradient: _bgGradient),
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Expanded(flex: 2, child: _imageWidget()),
          Expanded(flex: 3, child: _textWidget())
        ],
      ),
    );
  }

  _imageWidget() {
    return Image.asset(
      widget.image,
      fit: BoxFit.cover,
    );
  }

  _textWidget() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
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
              height: 20,
            ),
            Text(
              widget.data,
              style: Responsive.getTextStyle(context,
                  textColor: Colors.white,
                  weight: FontWeight.w500,
                  dSize: 13,
                  mSize: 13),
            )
          ],
        ));
  }
}
