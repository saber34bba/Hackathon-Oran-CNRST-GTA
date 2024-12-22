import 'package:flutter/material.dart';
import 'package:mobiurbain/Oran/BottomBarPresenter.dart';
import 'package:mobiurbain/utils/const.dart';
import 'package:provider/provider.dart';

class BottomAppBarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomAppBarView();
  }
}

class _BottomAppBarView extends State<BottomAppBarView> {
  late double height, width;
  late BottomBarPresenter bottomBarPresenter;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    bottomBarPresenter = Provider.of<BottomBarPresenter>(context);

    return Scaffold(body: Material(elevation: 2, child: bootomAppbar()));
  }

  Widget bootomAppbar() {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        height: height * 0.08,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Provider.of<BottomBarPresenter>(context, listen: false)
                    .setIndex(0);
              },
              child: Column(
                children: [
                  Image.asset(
                    "assets/oran/home.png",
                    width: 25,
                    color: bottomBarPresenter.index == 0
                        ? selectIcon
                        : Colors.grey,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Ink(
                    child: Text(
                      "الرئيسية",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: bottomBarPresenter.index == 0
                              ? selectIcon
                              : notselectedIcon),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Provider.of<BottomBarPresenter>(context, listen: false)
                    .setIndex(1);
              },
              child: Column(
                children: [
                  Image.asset("assets/oran/fawatir.png",
                      width: 25,
                      color: bottomBarPresenter.index == 1
                          ? selectIcon
                          : notselectedIcon),
                  SizedBox(
                    height: 5,
                  ),
                  Ink(
                    child: Text(
                      "الفواتير",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: bottomBarPresenter.index == 1
                              ? selectIcon
                              : notselectedIcon),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Provider.of<BottomBarPresenter>(context, listen: false)
                    .setIndex(2);
              },
              child: Column(
                children: [
                  Image.asset("assets/oran/calendar.png",
                      width: 25,
                      color: bottomBarPresenter.index == 2
                          ? selectIcon
                          : notselectedIcon),
                  SizedBox(
                    height: 5,
                  ),
                  Ink(
                    child: Text("المواعيد",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: bottomBarPresenter.index == 2
                                ? selectIcon
                                : notselectedIcon)),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Provider.of<BottomBarPresenter>(context, listen: false)
                    .setIndex(3);
              },
              child: Column(
                children: [
                  Image.asset("assets/oran/setting.png",
                      width: 25,
                      color: bottomBarPresenter.index == 3
                          ? selectIcon
                          : notselectedIcon),
                  SizedBox(
                    height: 5,
                  ),
                  Ink(
                    child: Text("اعدادات",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: bottomBarPresenter.index == 3
                                ? selectIcon
                                : notselectedIcon)),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
