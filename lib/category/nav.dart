import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store.dart';
import 'block_list.dart';

class CategoryNav extends StatefulWidget {
  @override
  _CategoryNavState createState() => _CategoryNavState();
}

class _CategoryNavState extends State<CategoryNav> {
  final _category = ['事件', '控制', '运算', '字符串', '变量', '列表', '字典', '函数'];
  final _categoryColor = [
    0xff68cdff,
    0xfffbbda2,
    0xff7E683B,
    0xff77e354,
    0xfff5b768,
    0xffffd263,
    0xff7d68f1,
    0xfff08f63
  ];

  isActive(index) {
    return index ==
        Provider.of<Store>(context, listen: false).selectedBlockBool;
  }

  @override
  Widget build(BuildContext context) {
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
              children: List.generate(_category.length, (index) {
            return Container(
              width: 200.0,
              height:
                  (MediaQuery.of(context).size.height - 80) / _category.length,
              padding: EdgeInsets.symmetric(vertical: 15.0),
              color: Color(0xfff7f2e7),
              child: SizedBox(
                  height: 60.0,
                  child: Consumer<Store>(
                    builder: (content, store, child) => IconButton(
                        color: isActive(index)
                            ? Color(_categoryColor[index])
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
                        child: Text(_category[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(
                                    isActive(index) ? 0xffffffff : 0xff7E683B),
                                fontSize: 20))),
                  )),
            );
          })),
        ),
        Consumer<Store>(
            builder: (context, store, child) => store.canShowBlockPool
                ? Positioned(
                    left: 180.0,
                    top: 0.0,
                    width: 400.0,
                    child: BlockList(store.selectedBlockBool),
                  )
                : Container())
      ],
    );
  }
}
