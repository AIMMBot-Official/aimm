import 'dart:math';

import 'package:aimm/views/home/banner_frame/banner_frame.dart';
import 'package:aimm/views/home/easy_frame/easy_frame.dart';
import 'package:aimm/views/home/great_frame/great_frame.dart';
import 'package:aimm/views/home/how_frame/how_frame.dart';
import 'package:aimm/views/home/landing_frame/landing_frame.dart';
import 'package:aimm/widgets/custom_appbar.dart';
import 'package:aimm/widgets/custom_drawer.dart';
import 'package:aimm/widgets/custom_footer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/FadeInListWidget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final _controller = ScrollController();
  bool _showBg = false;
  final startBg = Get.height * 0.75;
  final endBg = Get.height * 3;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.hasClients) {
        if (_controller.offset >= startBg && _controller.offset <= endBg) {
          setState(() {
            _showBg = true;
          });
        } else {
          setState(() {
            _showBg = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          _showBg ? _getSoftGlowBackground() : Container(),
          CustomScrollView(
            controller: _controller,
            slivers: [
              const CustomAppBar(),
              SliverList(
                  delegate: SliverChildListDelegate([
                const LandingFrame(),
                const FadeInListItem(child: HowFrame()),
                const EasyFrame(),
                const FadeInListItem(child: GreatFrame()),
                const BannerFrame(),
                const CustomFooter()
              ]))
            ],
          )
        ],
      ),
    );
  }

  _getSoftGlowBackground() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double offset = (_controller.offset - startBg) / (endBg - startBg);
        return Opacity(
          opacity: min(1.5 * offset, 1),
          child: child,
        );
      },
      child: Center(
          child: Image.asset(
        "assets/images/soft_glow.png",
        width: 1000,
        height: 1000,
      )),
    );
  }
}
