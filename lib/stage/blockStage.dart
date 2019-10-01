import 'package:flutter/material.dart';
import 'package:mylearn/category/nav.dart';
import 'package:provider/provider.dart';

import '../store.dart';
import 'dragItem.dart';
import 'stage.dart';

class BlockStage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
        builder: (context, store, child) => Stack(
              children: <Widget>[
                Positioned(
                    top: 0.0,
                    left: !store.canShowBlockPool ? 180.0 : 580,
                    height: MediaQuery.of(context).size.height - 80.0,
                    width: MediaQuery.of(context).size.width - 180.0,
                    child: store.canShowBlockPool
                        ? GestureDetector(
                            onTap: () =>
                                Provider.of<Store>(context, listen: false)
                                    .hideBlockBool(),
                            child: Stage())
                        : Stage()),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  height: MediaQuery.of(context).size.height,
                  width: store.canShowBlockPool ? 580.0 : 180,
                  child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: CategoryNav(),
                            )
                          ]
                      ),
                ),
                store.isDraging ? Positioned(
                  top: 0.0,
                  left: 0.0,
                  height: MediaQuery.of(context).size.height,
                  width: 180.0,
                  child: DragTarget(
                      onAccept: (DragModel model) {
                        store.removeBlockSvg(model.itemName);
                        store.setDraging(false);
                      },
                      onWillAccept: (int data) {
                        return false;
                      },
                      builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          /*一次性拖拽过来的个数*/
                          List<dynamic> rejected,
                          ) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.transparent,
                              ),
                            )
                          ],
                        );
                      })) : Container(),
              ],
            ));
  }
}
