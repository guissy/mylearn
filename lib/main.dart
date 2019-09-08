import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category/nav.dart';
import 'stage/blockStage.dart';
import 'stage/editor.dart';
import 'stage/stage.dart';
import 'stage/toolbar.dart';
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
        appBar: Toolbar(),
        body: Consumer<Store>(
            builder: (context, store, child) =>
                store.isCodeMode() ? Editor() : BlockStage()),
        floatingActionButton: Consumer<Store>(
            builder: (context, store, child) => store.isCodeMode()
                ? FloatingActionButton.extended(
                    icon: const Icon(
                      Icons.play_arrow,
                      size: 36.0,
                    ),
                    tooltip: "运行代码",
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xffffd236),
                    heroTag: null,
                    elevation: 1.0,
                    onPressed: () {},
                    label: Text('运行', style: TextStyle(fontSize: 24.0)),
                  )
                : Container()));
  }
}
