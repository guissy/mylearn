import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('for i in range(0, 10): pass', style: TextStyle(fontSize: 22.0),),
    );
  }
}
