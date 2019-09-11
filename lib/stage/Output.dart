import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store.dart';

class Output extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: Color(0xff414449),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              height: 50.0,
              color: Color(0xff3a3c40),
              padding: EdgeInsets.only(left: 25.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text('控制台',
                      style:
                          TextStyle(color: Color(0xffb0b1b2), fontSize: 20.0)),
                  IconButton(
                    iconSize: 36,
                    icon: const Icon(Icons.close, color: Color(0xffbfbfbf)),
                    onPressed: () {
                      Provider.of<Store>(context, listen: false).stopRunning();
                    },
                  )
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            alignment: Alignment.topLeft,
            child: Text(
                '程序运行结束',
                style: TextStyle(color: Color(0xffffffff), fontSize: 24.0)),
          )
        ],
      ),
    );
  }
}
