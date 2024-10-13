import 'package:aimm/views/home/banner_frame/banner_frame.dart';
import 'package:aimm/views/home/easy_frame/easy_frame.dart';
import 'package:aimm/views/home/great_frame/great_frame.dart';
import 'package:aimm/views/home/how_frame/how_frame.dart';
import 'package:aimm/views/home/landing_frame/landing_frame.dart';
import 'package:aimm/widgets/custom_appbar.dart';
import 'package:aimm/widgets/custom_footer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          const CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            const LandingFrame(),
            const HowFrame(),
            const EasyFrame(),
            const GreatFrame(),
            const BannerFrame(),
            const CustomFooter(),
          ]))
        ],
      ),
    );
  }
}
