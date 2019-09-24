import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../store.dart';

class BlockList extends StatelessWidget {
  final List<String> _event = 'code.svg,code2.svg,comment.svg,input.svg,print.svg,prompt.svg,start.svg'.split(',');
  final List<String> _control = 'break.svg,if.svg,if_then.svg,loop.svg,loop_var.svg,now.svg,skip.svg,try.svg,wait.svg,when_loop.svg'.split(',');
  final List<String> _calc = 'a_is_None.svg,absolute.svg,add.svg,add2.svg,asin.svg,ceil.svg,divide.svg,e.svg,equal.svg,factorial.svg,float.svg,float_range.svg,in.svg,int.svg,num.svg,ok.svg,ok_not.svg,pi.svg,random_choice.svg,sin.svg,sqrt.svg,squre.svg'.split(',');
  final List<String> _string = 'string.svg,string_in.svg,string_index.svg,string_int.svg,string_join.svg,string_len.svg,string_list.svg,string_lower.svg,string_slice.svg'.split(',');
  final List<String> _var = 'list01.svg'.split(',');
  final List<String> _list = 'list01.svg,list02.svg,list03.svg,list04.svg,list05.svg,list06.svg,list07.svg,list08.svg,list09.svg,list10.svg'.split(',');
  final List<String> _dict = 'dict01.svg,dict02.svg,dict03.svg,dict04.svg,dict05.svg,dict06.svg'.split(',');
  final List<String> _function = 'function01.svg,function02.svg,function03.svg,function04.svg'.split(',');
  final int _index;

  BlockList(this._index);

  @override
  Widget build(BuildContext context) {
    final List<List<String>> nodes = <List<String>>[_event, _control, _calc, _string, _var, _list, _dict, _function];
    final List<String> dirs = const <String>['event', 'control', 'calc', 'string', 'var',  'list', 'dict', 'function'];
    return Container(
      width: 500.0,
      height: MediaQuery.of(context).size.height - 80.0,
      decoration: BoxDecoration(color: Color(0xfff7f2e7)),
      child: ListView.builder(
          itemCount: nodes[_index].length,
          itemBuilder: (_, i) => Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            child: FlatButton(
              onPressed: () {
                Provider.of<Store>(context, listen: false).hideBlockBool();
                Provider.of<Store>(context, listen: false)
                    .addBlockSvg('assets/node/' + dirs[_index] + '/' + nodes[_index][i]);
              },
              child: Container(
                child: SvgPicture.asset('assets/node/' + dirs[_index] + '/' + nodes[_index][i]),
              ),
            ),
          )),
    );
  }
}
