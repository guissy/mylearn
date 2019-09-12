import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../store.dart';

class Stage extends StatefulWidget {
  @override
  _StageState createState() => _StageState();
}

class _StageState extends State<Stage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(color: Color(0xfff8f6f2)),
        child: Consumer<Store>(
            builder: (context, store, child) => ListView.builder(
                itemCount: store.blockSvgList.length,
                itemBuilder: (_, index) => Draggable<String>(
                      onDragCompleted: () {
                        // 在拖动结束后删除数据
                        setState(() {
//        _items.removeAt(index);
                        });
                      },
//                      feedbackOffset:
//                          Offset(MediaQuery.of(context).size.width / 2, 0),
                      feedback: Material(
                        child: Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/2 - 200.0),
                          child: SvgPicture.asset(store.blockSvgList[index]),
                        ),
                      ),
                      // 当前组件的数据
//    data: _items[index],
                      child: SvgPicture.asset(store.blockSvgList[index]),
                    ))));
  }
}
