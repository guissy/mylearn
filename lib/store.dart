import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum EditMode {
  block,
  code,
}

class Store with ChangeNotifier {
  int value = 0;
  int selectedBlockBool = 0;
  bool canShowBlockPool = false;
  String blockSvg = '';
  List<String> blockSvgList = [];
  EditMode mode = EditMode.block;
  bool codeRunning = false;
  bool isDraging = false;

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
  void addBlockSvg(String url) {
    this.blockSvg = url;
    this.blockSvgList.add(url);
    print(url);
    notifyListeners();
  }
  void removeBlockSvg(String url) {
    this.blockSvgList.remove(url);
    print(url);
    notifyListeners();
  }
  void toggleEditMode() {
    this.mode = this.mode == EditMode.code
        ? EditMode.block
        : EditMode.code;
    notifyListeners();
  }
  bool isCodeMode() {
    return this.mode == EditMode.code;
  }
  void startRunning() {
    this.codeRunning = true;
    notifyListeners();
  }
  void stopRunning() {
    this.codeRunning = false;
    notifyListeners();
  }
  void setDraging(bool doing) {
    this.isDraging = doing;
    notifyListeners();
  }
}