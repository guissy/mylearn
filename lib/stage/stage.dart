import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../store.dart';

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

  getOffset(String svg) {
    if (this._pos.containsKey(svg)) {
      var left = this._pos[svg][0];
      var top = this._pos[svg][1];
      return EdgeInsets.only(left: left, top: top);
    } else {
      return EdgeInsets.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(color: Color(0xfff8f6f2)),
        child: Consumer<Store>(
            builder: (context, store, child) => ListView.builder(
                itemCount: store.blockSvgList.length,
                itemBuilder: (_, index) => Draggable<String>(
                      onDragStarted: () {
                        print('🌹🌹🌹');
                        setState(() {
                          this._draging = store.blockSvgList[index];
                        });
                        store.removeBlockSvg(this._draging);
                      },
                      onDraggableCanceled: (a, offset) {
//                        offset.dx, offset.dy
                        !_pos.containsKey(this._draging)
                            ? _pos.putIfAbsent(
                                this._draging, () => [offset.dx, offset.dy])
                            : _pos.update(
                                this._draging, (_) => [offset.dx, offset.dy]);
                        store.addBlockSvg(this._draging);
                      },
                      onDragEnd: (e) {
                        print(e);
                        print('🌸🌸🌸🌺🌺🌺');
                      },
                      onDragCompleted: () {
                        print('🌸🌸🌸');
                        store.addBlockSvg(this._draging);
                        setState(() {
                          this._draging = '';
                        });
                      },
//                      feedbackOffset:
//                          Offset(MediaQuery.of(context).size.width / 2, 0),
                      feedback: Material(
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 2 -
                                  200.0),
                          child: SvgPicture.asset(store.blockSvgList[index]),
                        ),
                      ),
                      // 当前组件的数据
//    data: _items[index],
                      child: Container(
                        margin: this.getOffset(store.blockSvgList[index]),
                        child: SvgPicture.asset(store.blockSvgList[index]),
                      ),
                    ))));
  }
}
