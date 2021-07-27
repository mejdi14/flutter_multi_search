import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({Key? key, required this.label, required this.onTap}) : super(key: key);
  final String label;
  final Function onTap;

  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10,),
        Text(widget.label, style: TextStyle(fontSize: 20),),
        SizedBox(width: 4,),
        InkWell(onTap: (){
          print('nice');
          widget.onTap();
        },
            child: Icon(Icons.close, size: 15,))
      ],
    );
  }
}
