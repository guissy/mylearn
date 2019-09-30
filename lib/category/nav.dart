import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mylearn/abc/categoryEntity.dart';
import 'package:mylearn/stage/dragItem.dart';
import 'package:provider/provider.dart';

import '../store.dart';
import 'block_list.dart';

class CategoryNav extends StatefulWidget {
  @override
  _CategoryNavState createState() => _CategoryNavState();
}

class _CategoryNavState extends State<CategoryNav> {
  isActive(index) {
    return index ==
        Provider.of<Store>(context, listen: false).selectedBlockBool;
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(onAccept: (DragModel model) {
//          ToastUtil.show(context, "===" + model.itemName);
      print(model);
    }, onWillAccept: (DragModel model) {
      print(model);
    },builder: (
      BuildContext context,
      List<dynamic> accepted,
      /*一次性拖拽过来的个数*/
      List<dynamic> rejected,
    ) {
      return Stack(
        alignment: Alignment.topLeft,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0.0,
            width: 180.0,
            height: MediaQuery.of(context).size.height - 80,
            child: ListView(
                children: List.generate(CategoryItem.items.length, (index) {
              return Container(
                width: 180.0,
                height: (MediaQuery.of(context).size.height - 80) /
                    CategoryItem.items.length,
                padding: EdgeInsets.all(15.0),
                color: Color(0xfff7f2e7),
                child: SizedBox(
                    height: 60.0,
                    child: Consumer<Store>(
                      builder: (content, store, child) => FlatButton(
                          color: isActive(index)
                              ? Color(CategoryItem.items[index].color)
                              : Colors.transparent,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          onPressed: () {
                            if (isActive(index)) {
                              Provider.of<Store>(context, listen: false)
                                  .toggleBlockBool();
                            } else {
                              Provider.of<Store>(context, listen: false)
                                  .showBlockBool();
                            }
                            Provider.of<Store>(context, listen: false)
                                .selectBlockBool(index);
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor:
                                      Color(CategoryItem.items[index].color),
                                  child: SvgPicture.asset(
                                    'assets/node_icon/icn_blockly_' +
                                        CategoryItem.items[index].icon +
                                        '_inside.svg',
                                    color: Colors.white,
                                  ),
                                ),
                                Text('   ' + CategoryItem.items[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(isActive(index)
                                            ? 0xffffffff
                                            : 0xff7E683B),
                                        fontSize: 20))
                              ])),
                    )),
              );
            })),
          ),
          Consumer<Store>(
              builder: (context, store, child) => Positioned(
                    left: 180.0,
                    top: 0.0,
                    width: store.canShowBlockPool ? 400.0 : 0,
                    child: BlockList(store.selectedBlockBool),
                  ))
        ],
      );
    });
  }
}
