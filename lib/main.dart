import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'category/nav.dart';
import 'stage/stage.dart';
import 'store.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => Store(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xffffd236),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height - 80);
    return Scaffold(
      appBar: AppBar(
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
            child: Text('文件', style: TextStyle(fontSize: 24.0),),
          ),
          IconButton(
            iconSize: 40.0,
            icon: Icon(Icons.save),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all()
            ),
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Text('新的作品', style: TextStyle(fontSize: 24),),
          )
        ],
      ),
      body: Container(
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
      )),
    );
  }
}
