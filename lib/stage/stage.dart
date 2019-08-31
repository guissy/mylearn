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
                itemBuilder: (_, index) =>
                    SvgPicture.asset(store.blockSvgList[index]))));
  }
}
