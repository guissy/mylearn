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
                store.isCodeMode() ? Editor() : BlockStage()));
  }
}
