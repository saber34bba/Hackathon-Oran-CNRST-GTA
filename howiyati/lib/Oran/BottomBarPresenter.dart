import 'package:flutter/material.dart';

class BottomBarPresenter extends ChangeNotifier {
  int index = 0;
  late PageController pageController =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1);

  changePageController(int _index) {
    pageController.jumpToPage(_index);
    notifyListeners();
  }

  setIndex(int _index) {
    index = _index;
    changePageController(_index);
    notifyListeners();
  }

}
