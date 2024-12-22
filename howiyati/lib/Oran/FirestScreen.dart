import 'package:flutter/material.dart';
import 'package:mobiurbain/Oran/BottomAppBarView.dart';
import 'package:mobiurbain/Oran/BottomBarPresenter.dart';
import 'package:mobiurbain/Oran/CustomCalendar.dart';
import 'package:mobiurbain/Oran/HomeApp.dart';
import 'package:mobiurbain/Oran/RdvView.dart';
import 'package:mobiurbain/Oran/Setting.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstScreen();
  }
}

class _FirstScreen extends State<FirstScreen> {
  late double height, width;
  late BottomBarPresenter bottomBarPresenter;

  @override
  Widget build(BuildContext context) {
    bottomBarPresenter = Provider.of<BottomBarPresenter>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffF9F9FB),
      body: Stack(
        children: [
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: bottomBarPresenter.pageController,
            children: [
              HomeApp(),
              RdvView(),
              CustomCalendar(),
              Setting()
            ],
          ),
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: 80,
              child: BottomAppBarView(),
            ),
          ),
        ],
      ),
    );
  }
}
