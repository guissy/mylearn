import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../store.dart';

double appBarHeight = 0.0;

double statusBarHeight = 0.0;

double screenHeight = 0.0;

double screenWidth = 0.0;

double leftWidth = 200.0;

const double drag_item_height = 80.0;


class DragItem extends StatefulWidget {
  final DragModel svg;

  DragItem(this.svg);

  @override
  _DragItemState createState() => _DragItemState();
}

class _DragItemState extends State<DragItem> {
  Offset pos = new Offset(0.0, 0.0);


  @override
  void initState() {
    super.initState();
    pos = widget.svg.itemPos;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    appBarHeight = 100.0;
    return Consumer<Store>(
        builder: (context, store, child) => Positioned(
              left: pos.dx,
              top: pos.dy,
              child: Draggable<String>(
                onDragStarted: () {
//                  print('🌹🌹🌹');
//                  setState(() {
//                    this._draging = item;
//                  });
//                  store.removeBlockSvg(this._draging);
                },
                onDraggableCanceled: (a, offset) {
                  //坐标是根据全屏算的，需要计算appbar和statusBar的高度

                  double dx = offset.dx - leftWidth;
                  double dy = offset.dy - appBarHeight - statusBarHeight;

                  //临界点判断 保证不会被拖出屏幕
                  if (dx < 0) {
                    dx = 0.0;
                  }

                  if (dx > screenWidth - drag_item_height) {
                    dx = screenWidth - drag_item_height;
                  }

                  if (dy < 0) {
                    dy = 0.0;
                  }

                  if (offset.dy + drag_item_height > screenHeight) {
                    dy = screenHeight -
                        drag_item_height -
                        appBarHeight -
                        statusBarHeight;
                  }

//                  pos = new Offset(dx, dy);
                  setState(() {
                    print(offset);
                    print(dx);
                    print(dy);
                    this.pos = new Offset(dx, dy);
                  });
//                  !_pos.containsKey(this._draging)
//                      ? _pos.putIfAbsent(
//                          this._draging, () => [offset.dx, offset.dy])
//                      : _pos.update(
//                          this._draging, (_) => [offset.dx, offset.dy]);
//                  store.addBlockSvg(this._draging);
                },
                feedback: Material(
                  color: Colors.transparent,
                  child: SvgPicture.asset(widget.svg.itemName),
                ),
                // 当前组件的数据
//    data: _items[index],
                child: SvgPicture.asset(widget.svg.itemName),
              ),
            ));
  }
}

class DragModel {
  final Offset itemPos;

  final String itemName;

  final Color itemBgColor;

  DragModel(this.itemPos, this.itemName, this.itemBgColor);
}
