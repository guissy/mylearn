import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store.dart';

class Toolbar extends StatefulWidget with PreferredSizeWidget {
  @override
  _ToolbarState createState() => _ToolbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


class _ToolbarState extends State<Toolbar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          iconSize: 40.0,
          icon: Icon(Icons.home),
        ),
        IconButton(
          iconSize: 40.0,
          icon: Icon(Icons.folder_open),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            '文件',
            style: TextStyle(fontSize: 22.0),
          ),
        ),
        IconButton(
          iconSize: 40.0,
          icon: Icon(Icons.save),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(border: Border.all()),
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(
            '新的作品',
            style: TextStyle(fontSize: 22),
          ),
        ),
        Container(
          margin: EdgeInsets.all(9.0),
          child: Consumer<Store>(
            builder: (context, store, child) => FlatButton(
              onPressed: () {
                setState(() {
                  store.toggleEditMode();
                });
              },
              color: Color(0xffff872f),
              shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(store.isCodeMode() ? Icons.edit : Icons.store, color: Color(0xffffffff),),
                    Text(store.isCodeMode() ? ' 代码模式' : ' 积木模式', style: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20
                    ))
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
