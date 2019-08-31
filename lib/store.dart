import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Store with ChangeNotifier {
  int value = 0;
  int selectedBlockBool = 0;
  bool canShowBlockPool = false;
  String blockSvg = '';
  List<String> blockSvgList = [];

  void increment() {
    value += 1;
    notifyListeners();
  }
  void hideBlockBool() {
    canShowBlockPool = false;
    notifyListeners();
  }
  void toggleBlockBool() {
    canShowBlockPool = !canShowBlockPool;
    notifyListeners();
  }
  void showBlockBool() {
    canShowBlockPool = true;
    notifyListeners();
  }
  void selectBlockBool(int index) {
    this.selectedBlockBool = index;
    notifyListeners();
  }
  void setBlockSvg(String url) {
    this.blockSvg = url;
    this.blockSvgList.add(url);
    print(url);
    notifyListeners();
  }
}