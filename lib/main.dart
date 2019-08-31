import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category/nav.dart';
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
        primarySwatch: Colors.blue,
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
        title: Text('🌺🌺🌺'),
      ),
      body: Container(
//        width: MediaQuery.of(context).size.width,
//        height: MediaQuery.of(context).size.height - 80,
          child: Stack(
//          mainAxisAlignment: MainAxisAlignment.start,
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Positioned(
              top: 0.0,
              left: 180.0,
              height: MediaQuery.of(context).size.height - 80.0,
              width: MediaQuery.of(context).size.width - 180.0,
              child: GestureDetector(
                onTap: () => Provider.of<Store>(context, listen: false).hideBlockBool(),
                  child: Container(
                decoration: BoxDecoration(color: Color(0xffcceeee)),
                child: Text(
                    '某君的QQ状态很搞，上面浪漫的写着：“你五毛我五毛，那么咱俩就能凑一块了！”众人羡慕之时，另一女说到：“你六毛我六毛咱俩就能一块2了。”再另一女接到：“你七毛我七毛，咱俩就能一块死了……”',
                    style: TextStyle(fontSize: 24.0)),
              ))),
          Positioned(
            top: 0.0,
            left: 0.0,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 180.0,
                    child: CategoryNav(),
                  ),
                )

//            Consumer<Store>(
//              builder: (context, store, child) => Text(
//                '${store.value}',
//                style: Theme.of(context).textTheme.display1,
//              ),
//            ),
              ],
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<Store>(context, listen: false).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
