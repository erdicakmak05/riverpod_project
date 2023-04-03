import 'package:flutter/cupertino.dart';
import 'package:riverpod_project/view/favorite/favorite.dart';

import '../view/sepet/sepet.dart';
import '../view/home/anasayfa.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
        ),
        label: "Anasayfa"),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.heart),
      label: "Favoriler",
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.bag),
      label: "Sepet",
    ),
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String appBarTitle() {
    switch (currentIndex) {
      case 0:
        return "Anasayfa";
        break;
      case 1:
        return "Favoriler";
        break;
      case 2:
        return "Sepet";
        break;
      default:
        return "Anasayfa";
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return Anasayfa();
        break;
      case 1:
        return Favoriler();
        break;
      case 2:
        return Sepet();
        break;
      default:
        return Anasayfa();
    }
  }
}
