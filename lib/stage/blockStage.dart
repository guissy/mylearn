import 'package:flutter/material.dart';
import 'package:mylearn/category/nav.dart';
import 'package:provider/provider.dart';

import '../store.dart';
import 'stage.dart';

class BlockStage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: <Widget>[
            Consumer<Store>(
                builder: (context, store, child) => Positioned(
                    top: 0.0,
                    left: !store.canShowBlockPool ? 180.0 : 580,
                    height: MediaQuery.of(context).size.height - 80.0,
                    width: MediaQuery.of(context).size.width - 180.0,
                    child: Consumer<Store>(
                        builder: (context, store, child) => store.canShowBlockPool
                            ? GestureDetector(
                            onTap: () =>
                                Provider.of<Store>(context, listen: false)
                                    .hideBlockBool(),
                            child: Stage())
                            : Stage()))),
            Positioned(
              top: 0.0,
              left: 0.0,
              height: MediaQuery.of(context).size.height,
              width: 580.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: CategoryNav(),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
