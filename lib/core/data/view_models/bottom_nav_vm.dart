
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class BottomNavVm extends ChangeNotifier{

  //current index of the bottom nav-bar
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setCurrentIndex(int value, {bool refreshUi = true}){
    _currentIndex = value;
    if(refreshUi){
      notifyListeners();
    }
  }


  //children of the bottom Nav
  final List<Widget>  _screens = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  List<Widget> get screens => _screens;


  //updates the current index of the bottom nav
  void updateIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

}

final bottomNavViewModel = ChangeNotifierProvider.autoDispose<BottomNavVm>((ref){
  return BottomNavVm();
});