import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../store.dart';
import 'dragItem.dart';

class Stage extends StatefulWidget {
  @override
  _StageState createState() => _StageState();
}

class _StageState extends State<Stage> {
  String _draging = "";
  Map<String, List<double>> _pos = new Map();

  @override
  void initState() {
    super.initState();
  }

  dynamic getOffset(String svg) {
    if (this._pos.containsKey(svg)) {
      var left = this._pos[svg][0];
      var top = this._pos[svg][1];
      return {'left': left, 'top': top};
    } else {
      return {'left': 0, 'top': 0};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(color: Color(0xfff8f6f2)),
        child: Consumer<Store>(
            builder: (context, store, child) => Stack(
                children: (List.generate(
                    store.blockSvgList.length,
                    (index) => new DragItem(new DragModel(
                        Offset(0.0, (48 * index).toDouble()),
                        store.blockSvgList[index],
                        Colors.red)) as Widget) as List<Widget>))));
  }
}
